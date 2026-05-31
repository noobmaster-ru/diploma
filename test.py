class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __repr__(self):
        return f"User(name={self.name!r}, age={self.age!r})"

    def __str__(self):
        return f"{self.name}, {self.age} лет"

u = User("Kirill", 22)

print(str(u))  # Kirill, 22 лет
print(u)       # Kirill, 22 лет
print(repr(u)) # User(name='Kirill', age=22)
