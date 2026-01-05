from random import randint
# CustomerID
# FirstName
# LastName

# INSERT INTO [dbo].[Individuals] ([CustomerID], [FirstName], [LastName])

imiona = ["James", "Mary", "Jeffrey", "Michael", "John", "Jennifer", "Patricia", "Linda", "William", "Elizabeth"]

nazwiska = ["Smith", "Island", "Williams", "Rodriguez", "Martinez"]

counter = 0
print('VALUES ')
for i in range(5):
    for j in range(5):
        print(f"({counter}, '{imiona[i]}', '{nazwiska[j]}'),")
        counter += 1 