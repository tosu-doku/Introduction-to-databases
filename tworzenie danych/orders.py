from random import randint
import datetime as dt
# INSERT INTO [dbo].[Orders] (
#     --[OrderID],    -- before auto ID
#     [CustomerID],
#     [OrderDate],
#     [Discount],
#     [RequiredDate],
#     [CompletedDate], --Optional
#     [IsCanceled]
# )

# x = dt.datetime.now()
basedate = dt.datetime(2026, 1, 1) 
moveDays = dt.timedelta(days=1)

orders = []

# 0-50 no discount | 51-70 5% discount | 71-90 10% discount | 91-100 25% discount
def discount(a : int) -> float:
    if(a<=50):
        return 0
    elif(a<=70):
        return 0.05
    elif(a<=90):
        return 0.1
    else:
        return 0.25

# 95% nie canceled
def canceled(a : int) -> str:
    if(a<=95):
        return "FALSE"
    else:
        return "TRUE"

for i in range(40):    
    moveDays = dt.timedelta(days=randint(1,120))
    orderdate = basedate + moveDays
    moveDaysReq = dt.timedelta(days=randint(2,10))

    requiredDate = orderdate + moveDaysReq

    moveDaysComp = dt.timedelta(days=randint(1,int(moveDaysReq.days)))

    completedDate = orderdate + moveDaysComp

    #OrderID CustomerID OrderDate Discount RequiredDate DateCompleted IsCanceled
    orders.append((orderdate, (f"({0}, '{randint(0,34)}', '{orderdate.strftime("%Y-%m-%d")}', {discount(randint(0,100))}, '{requiredDate.strftime("%Y-%m-%d")}', NULL, '{canceled(randint(0,100))}'),")))
    # NULL ZAMIAST '{completedDate.strftime("%Y-%m-%d")}'
orders.sort(key = lambda x : x[0])

print(orders, sep='\n')

counter = 0
with open("orders.txt", "w") as f:
    print(    "OrderID CustomerID OrderDate Discount RequiredDate DateCompleted IsCanceled \n VALUES")
    for id, o in orders:
        # print(o.replace("(0,",'('+str(counter) + ','))
        # f.write(o.replace("(0,",'('+str(counter) + ',')+"\n")
        print(o.replace("(0, ",'('))
        f.write(o.replace("(0, ",'(')+"\n")
        counter+=1

f.close