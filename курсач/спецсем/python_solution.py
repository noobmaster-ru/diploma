import numpy as np
from scipy.optimize import fsolve

# параметры
alfa = 0.45
beta = 0.95
delta = 0.025
phi = 1.0
ksi_1 = 1.5
ksi_2 = 0.5


def func(vars, alfa, delta, omega, phi, ksi, R):
    L, C = vars
    eq1 = L * (R / alfa) ** (alfa / (alfa - 1)) * (1 - delta * alfa / R) - C
    eq2 = L - (omega / (phi * C)) ** (1 / ksi)
    return [eq1, eq2]

def solve(ksi,R_star,omega_star):
    solution_1 = fsolve(func, [1, 1], args=(alfa, delta, omega_star, phi, ksi, R_star))
    L_star_1, C_star_1= solution_1
    Y_star_1 = omega_star*L_star_1 /(1-alfa)
    I_star_1 = Y_star_1 - C_star_1
    K_star_1 = I_star_1/delta
    return [L_star_1,C_star_1,Y_star_1,I_star_1,K_star_1]

def print_solution(solution,index):
    print(f"L_star_{index} = {solution[0]:.6f}")
    print(f"C_star_{index} = {solution[1]:.6f}")
    print(f"Y_star_{index} = {solution[2]:.6f}")
    print(f"I_star_{index} = {solution[3]:.6f}")
    print(f"K_star_{index} = {solution[4]:.6f}\n")
    
if __name__ == "__main__":
    R_star = (1/beta) - 1 + delta
    omega_star = (R_star/alfa) ** (alfa/(alfa-1))

    print(f"R_star = {R_star:.6f}")
    print(f"Omega_star= {omega_star:.6f}\n")

    solution_1 = solve(ksi_1,R_star,omega_star)
    solution_2 = solve(ksi_2,R_star,omega_star)
    L_star_1 , C_star_1, Y_star_1 , I_star_1 , K_star_1 = solution_1
    L_star_2 , C_star_2, Y_star_2 , I_star_2, K_star_2 = solution_2

    print_solution(solution_1,1)
    print_solution(solution_2,2)
