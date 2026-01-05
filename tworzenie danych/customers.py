from random import randint
# CustomerID
# Email
# PhoneNumber   OPTIONAL
# Fax OPTIONAL

# INSERT INTO [dbo].[Customers] ([CustomerID], [Email], [PhoneNumber], [Fax])


imiona = ["James", "Mary", "Jeffrey", "Michael", "John", "Jennifer", "Patricia", "Linda", "William", "Elizabeth"]

nazwiska = ["Smith", "Island", "Williams", "Rodriguez", "Martinez"]

print('VALUES ')
counter = 0
for i in range(5):
    for j in range(5):
        print(f"({counter}, '{imiona[i]}.{nazwiska[j]}@example.com', '{randint(100000000,999999999)}', '{randint(100000000,999999999)}'),")
        counter += 1 

        
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

for i in range(10):
        print(f"({counter}, '{firmy[i].replace(" ","")}@examplecompany.com', '{randint(100000000,999999999)}', '{randint(100000000,999999999)}'),")
        counter += 1 