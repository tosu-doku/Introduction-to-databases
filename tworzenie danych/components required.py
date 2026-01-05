from random import randint
# ProductID
# ComponentID
# Amount

# INSERT INTO [dbo].[Components Required] ([ProductID],[ComponentID],[Amount])

def getID(line):
    line = line.split(",")
    id = line[0]
    id = id.replace("(","")
    return id


with open("products.txt") as prod, open("components.txt") as componentsFile, open("componentsReq.txt","w") as componentsReq:
    components = componentsFile.readlines()
    for line in prod:
        prodID = getID(line)
        # ProductID ComponentID Amount
        for c in components:
            cID = getID(c)
            amountReq = randint(-1,9)
            if(amountReq<=0):
                continue
            print(f"({prodID},{cID},{amountReq}),")
            componentsReq.write(f"({prodID},{cID},{amountReq}),\n")

prod.close()
componentsFile.close()
componentsReq.close()