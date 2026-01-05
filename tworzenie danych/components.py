from random import randint
# INSERT INTO [dbo].[Components] (
#     [ComponentID],
#     [ComponentName],
#     [QuantityInStock],
#     [MaxQuantityInStock],
#     [ComponentCategoryID],
#     [ComponentCost]
# )

# 0 - wood, 1 - metal, 2 - other
ComponentNames = ['wooden plank','metal bar','screws','rubber strap','leather',]

with open("components.txt", "w") as f:
    for i in range(len(ComponentNames)):
        amountInStock = randint(80,400)
        #        ComponentID ComponentName QuantityInStock MaxQuantityInStock ComponentCategoryID ComponentCost
        print(f"({i}, '{ComponentNames[i]}', {amountInStock}, {amountInStock*randint(1,4)}, {(i+1)//2}, {randint(1,130)/10}),")
        f.write(f"({i}, '{ComponentNames[i]}', {amountInStock}, {amountInStock*randint(1,4)}, {(i+1)//2}, {randint(1,130)/10}),\n")