from random import randint
# CustomerID
# CompanyName
# NIP

# INSERT INTO [dbo].[Companies] ([CustomerID], [CompanyName], [NIP])


firmy = [
    "FanoPlane Solutions",
    "Global Logistics Inc.",
    "Apex Predator LLC",
    "Blue Sky Ventures",
    "Starlight Enterprises",
    "Quantum Dynamics",
    "Flight Systems",
    "Summit Financial Group",
    "Ironclad Security",
    "Velocity Marketing"
]

counter = 25
print('VALUES ')
for i in range(10):
    print(f"({counter}, '{firmy[i]}', '{randint(1000000000,9999999999)}'),")
    counter += 1 