# ProductCategoryID	int	
# CategoryName	nvarchar(25)

# INSERT INTO [dbo].[Product Category] (ProductCategoryID, CategoryName)

productCategories = ['desk','chair','cupboard']

for i in range(3):
    print(f"({i},'{productCategories[i]}'),")