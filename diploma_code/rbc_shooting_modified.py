import numpy as np
import matplotlib.pyplot as plt
from dataclasses import dataclass
from scipy.optimize import brentq, minimize_scalar
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401

@dataclass
class Params:
    beta: float = 0.96
    alpha: float = 0.33
    A: float = 0.95
    sigma: float = 1.0
    delta: float = 0.10
    phi: float = 0.75
    psi: float = 0.35

def labor_from_KC(K, C, p: Params):
    if K <= 0 or C <= 0:
        return np.nan
    base = ((1.0 - p.alpha) * p.A * K**p.alpha) / (p.phi * C)
    if base <= 0:
        return np.nan
    return base ** (1.0 / (p.psi + p.alpha))

def output_from_KC(K, C, p: Params):
    L = labor_from_KC(K, C, p)
    if not np.isfinite(L) or L <= 0:
        return np.nan
    return p.A * K**p.alpha * L**(1.0 - p.alpha)

def rental_from_KC(K, C, p: Params):
    Y = output_from_KC(K, C, p)
    if not np.isfinite(Y) or K <= 0:
        return np.nan
    return p.alpha * Y / K

def wage_from_KC(K, C, p: Params):
    L = labor_from_KC(K, C, p)
    Y = output_from_KC(K, C, p)
    if not np.isfinite(L) or not np.isfinite(Y) or L <= 0:
        return np.nan
    return (1.0 - p.alpha) * Y / L

def steady_state(p: Params):
    R_star = 1.0 / p.beta - 1.0 + p.delta
    v = R_star / p.alpha - p.delta
    L_star = (((1.0 - p.alpha) * R_star) / (p.alpha * p.phi * v)) ** (1.0 / (p.psi + 1.0))
    K_star = ((p.alpha * p.A * L_star**(1.0 - p.alpha)) / R_star) ** (1.0 / (1.0 - p.alpha))
    C_star = v * K_star
    Y_star = p.A * K_star**p.alpha * L_star**(1.0 - p.alpha)
    I_star = p.delta * K_star
    w_star = (1.0 - p.alpha) * Y_star / L_star
    return {
        "R_star": R_star,
        "v": v,
        "K_star": K_star,
        "C_star": C_star,
        "L_star": L_star,
        "Y_star": Y_star,
        "I_star": I_star,
        "S_star": I_star,
        "w_star": w_star,
    }

def solve_C_next(K_next, C_t, p: Params, ss):
    def g(C_next):
        if C_next <= 0:
            return -1e12
        R_next = rental_from_KC(K_next, C_next, p)
        if not np.isfinite(R_next):
            return np.nan
        return C_next - p.beta * (1.0 + R_next - p.delta) * C_t

    left = 1e-12
    right = max(20.0 * ss["C_star"], 20.0 * C_t, 5.0)
    g_left = g(left)
    g_right = g(right)
    for _ in range(100):
        if np.isfinite(g_left) and np.isfinite(g_right) and g_left * g_right < 0:
            break
        right *= 2.0
        g_right = g(right)
    if not (np.isfinite(g_left) and np.isfinite(g_right) and g_left * g_right < 0):
        raise RuntimeError("Could not bracket root for C_(t+1).")
    return brentq(g, left, right, xtol=1e-12, rtol=1e-10, maxiter=500)

def simulate_path(K0, C0, T, p: Params, ss):
    K = np.empty(T + 1)
    C = np.empty(T + 1)
    L = np.empty(T + 1)
    Y = np.empty(T + 1)
    R = np.empty(T + 1)
    w = np.empty(T + 1)
    I = np.empty(T + 1)
    K[0] = K0
    C[0] = C0
    for t in range(T):
        L[t] = labor_from_KC(K[t], C[t], p)
        Y[t] = output_from_KC(K[t], C[t], p)
        R[t] = rental_from_KC(K[t], C[t], p)
        w[t] = wage_from_KC(K[t], C[t], p)
        I[t] = Y[t] - C[t]
        if not np.isfinite(L[t]) or not np.isfinite(Y[t]) or I[t] < -1e-10:
            raise RuntimeError(f"Infeasible path at t={t}.")
        K[t + 1] = I[t] + (1.0 - p.delta) * K[t]
        if K[t + 1] <= 0:
            raise RuntimeError(f"Nonpositive K_(t+1) at t={t}.")
        C[t + 1] = solve_C_next(K[t + 1], C[t], p, ss)
    L[T] = labor_from_KC(K[T], C[T], p)
    Y[T] = output_from_KC(K[T], C[T], p)
    R[T] = rental_from_KC(K[T], C[T], p)
    w[T] = wage_from_KC(K[T], C[T], p)
    I[T] = Y[T] - C[T]
    return {"K": K, "C": C, "L": L, "Y": Y, "R": R, "w": w, "I": I}

def shooting_objective(C0, K0, T, p: Params, ss):
    try:
        path = simulate_path(K0, C0, T, p, ss)
        term = ((path["K"][-1] - ss["K_star"]) / ss["K_star"]) ** 2 + ((path["C"][-1] - ss["C_star"]) / ss["C_star"]) ** 2
        path_penalty = 0.01 * np.mean(((path["K"] - ss["K_star"]) / ss["K_star"]) ** 2)
        return term + path_penalty
    except Exception:
        return 1e9

def find_optimal_C0(K0, T, p: Params, ss):
    res = minimize_scalar(
        lambda c: shooting_objective(c, K0, T, p, ss),
        bounds=(0.20 * ss["C_star"], 1.60 * ss["C_star"]),
        method="bounded",
        options={"xatol": 1e-8},
    )
    return res.x, res.fun

if __name__ == "__main__":
    p = Params()
    ss = steady_state(p)
    print("=== STEADY STATE ===")
    for k, v in ss.items():
        print(f"{k:8s} = {v:.10f}")
    T = 40
    for label, K0 in [("low", 0.80 * ss["K_star"]), ("high", 1.20 * ss["K_star"])]:
        C0, obj = find_optimal_C0(K0, T, p, ss)
        path = simulate_path(K0, C0, T, p, ss)
        print(f"\nCase: {label}")
        print(f"K0={K0:.10f}, C0={C0:.10f}, objective={obj:.8e}")
        print(f"K_T={path['K'][-1]:.10f}, C_T={path['C'][-1]:.10f}, L_T={path['L'][-1]:.10f}, Y_T={path['Y'][-1]:.10f}")
