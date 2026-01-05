from random import randint
# INSERT INTO [dbo].[Products] (
#     [ProductID],
#     [ProductCategoryID],
#     [ProductName],
#     [ManufactureCost],
#     [MaxDailyOutput],
#     [SellPrice],
#     [QuantityInStock],
#     [ProductionLimit],
#     [IsCanceled]
# )VALUES

products = ['standing desk', 'gaming desk', 'office chair', 'gaming chair', 'cupboard']

with open("products.txt","w") as f:
    for i in range(5): 
        manufactureCost = randint(30,70)
        sellprice = round(manufactureCost*(randint(6,12)/5))
        instock = randint(3,25)*10
        prodlimit = instock * randint(1,3)
        #       ProductID ProductCategoryID ProductName ManufactureCost SellPrice QuantityInStock MaxDailyOutput ProductionLimit IsCanceled   
        print(f"({i}, {i//2}, '{products[i]}', {manufactureCost}, {sellprice}, {instock}, {randint(5,12)}, {prodlimit}, 'FALSE'),")
        f.write(f"({i}, {i//2}, '{products[i]}', {manufactureCost}, {sellprice}, {instock}, {randint(5,12)}, {prodlimit}, 'FALSE'),\n")
