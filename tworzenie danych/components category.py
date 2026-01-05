# ComponentCategoryID
# CategoryName

# INSERT INTO [dbo].[Component Category] (ComponentCategoryID, CategoryName)

CategoryNames = ['wood','metal','other']

for i in range(len(CategoryNames)):
    print(f"({i}, '{CategoryNames[i]}'),")