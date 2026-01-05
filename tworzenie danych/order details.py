from random import randint
# OrderID
# ProductID
# Quantity

# INSERT INTO [dbo].[Order Details] (OrderID, ProductID, Quantity)
lastProductId = 4 # 

orderIdRange = (48,87)

# 48 87
orderID = 48
with open("orders.txt") as o, open("order details.txt","w") as od:
    o.readline
    print("OrderID ProductID Quantity \n VALUES")
    for line in o:
        buckets = [False] * (lastProductId+1)
        # line = line.split(",")
        # orderID = line[0]
        # orderID = orderID.replace("(","")
        
    # OrderID, ProductID, Quantity

        for i in range(3):
            randomizedProduct = randint(0,lastProductId)
            if(buckets[randomizedProduct] == False):
                buckets[randomizedProduct] = True
                print(f"({orderID}, {randomizedProduct}, {randint(1,5)}),")  
                od.write(f"({orderID}, {randomizedProduct}, {randint(1,5)}),\n")
        orderID += 1