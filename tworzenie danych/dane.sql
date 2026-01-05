--delete from Individuals;
--delete from Companies;
--delete from customers;
--delete from [Order Details];
--delete from orders;
--delete from products;
--delete from [Product Category];
--delete from Manufacturing;
--delete from Components;
--delete from [Component Category];
--delete from [Components Required];

-- Customers
INSERT INTO [dbo].[Customers] ([CustomerID], [Email], [PhoneNumber], [Fax])
VALUES 
(0, 'James.Smith@example.com', '255829998', '790333320'),
(1, 'James.Island@example.com', '310590220', '352246248'),
(2, 'James.Williams@example.com', '996110014', '387106081'),
(3, 'James.Rodriguez@example.com', '924926351', '860803519'),
(4, 'James.Martinez@example.com', '231933641', '493942884'),
(5, 'Mary.Smith@example.com', '516533264', '956821786'),
(6, 'Mary.Island@example.com', '457320087', '291814977'),
(7, 'Mary.Williams@example.com', '708153080', '831347964'),
(8, 'Mary.Rodriguez@example.com', '447020123', '333304459'),
(9, 'Mary.Martinez@example.com', '578158250', '697443296'),
(10, 'Jeffrey.Smith@example.com', '954039321', '590297525'),
(11, 'Jeffrey.Island@example.com', '650407611', '750423570'),
(12, 'Jeffrey.Williams@example.com', '812606666', '251437538'),
(13, 'Jeffrey.Rodriguez@example.com', '573860748', '849408769'),
(14, 'Jeffrey.Martinez@example.com', '398806432', '441780031'),
(15, 'Michael.Smith@example.com', '570852684', '473705181'),
(16, 'Michael.Island@example.com', '719307965', '657136968'),
(17, 'Michael.Williams@example.com', '593554791', '628320088'),
(18, 'Michael.Rodriguez@example.com', '386289380', '868217135'),
(19, 'Michael.Martinez@example.com', '361482123', '463512980'),
(20, 'John.Smith@example.com', '941230198', '274808769'),
(21, 'John.Island@example.com', '922756699', '752784373'),
(22, 'John.Williams@example.com', '618473083', '656262032'),
(23, 'John.Rodriguez@example.com', '673755907', '659725222'),
(24, 'John.Martinez@example.com', '495695811', '323905298'),
(25, 'FanoPlane Solutions@examplecompany.com', '959355743', '377525731'),
(26, 'Global Logistics Inc.@examplecompany.com', '661819231', '754469394'),
(27, 'Apex Predator LLC@examplecompany.com', '792208520', '409388870'),
(28, 'Blue Sky Ventures@examplecompany.com', '309932811', '106887515'),
(29, 'Starlight Enterprises@examplecompany.com', '520743164', '493709015'),
(30, 'Quantum Dynamics@examplecompany.com', '980496958', '974221579'),
(31, 'Flight Systems@examplecompany.com', '658945169', '585997209'),
(32, 'Summit Financial Group@examplecompany.com', '980708367', '897303447'),
(33, 'Ironclad Security@examplecompany.com', '732937207', '269728721'),
(34, 'Velocity Marketing@examplecompany.com', '728132721', '415064339');

-- Individuals
INSERT INTO [dbo].[Individuals] ([CustomerID], [FirstName], [LastName])
VALUES
(0, 'James', 'Smith'),
(1, 'James', 'Island'),
(2, 'James', 'Williams'),
(3, 'James', 'Rodriguez'),
(4, 'James', 'Martinez'),
(5, 'Mary', 'Smith'),
(6, 'Mary', 'Island'),
(7, 'Mary', 'Williams'),
(8, 'Mary', 'Rodriguez'),
(9, 'Mary', 'Martinez'),
(10, 'Jeffrey', 'Smith'),
(11, 'Jeffrey', 'Island'),
(12, 'Jeffrey', 'Williams'),
(13, 'Jeffrey', 'Rodriguez'),
(14, 'Jeffrey', 'Martinez'),
(15, 'Michael', 'Smith'),
(16, 'Michael', 'Island'),
(17, 'Michael', 'Williams'),
(18, 'Michael', 'Rodriguez'),
(19, 'Michael', 'Martinez'),
(20, 'John', 'Smith'),
(21, 'John', 'Island'),
(22, 'John', 'Williams'),
(23, 'John', 'Rodriguez'),
(24, 'John', 'Martinez');

-- Companies
INSERT INTO [dbo].[Companies] ([CustomerID], [CompanyName], [NIP])
VALUES
(25, 'FanoPlane Solutions', '4083313032'),
(26, 'Global Logistics Inc.', '1965639419'),
(27, 'Apex Predator LLC', '2923803071'),
(28, 'Blue Sky Ventures', '8507554171'),
(29, 'Starlight Enterprises', '3522840149'),
(30, 'Quantum Dynamics', '1187540805'),
(31, 'Flight Systems', '6514328264'),
(32, 'Summit Financial Group', '2568372174'),
(33, 'Ironclad Security', '3539155400'),
(34, 'Velocity Marketing', '6334405480');

-- Orders
INSERT INTO [dbo].[Orders] (
    [OrderID],
    [CustomerID],
    [OrderDate],
    [Discount],
    [RequiredDate],
    [CompletedDate],
    [IsCanceled]
)
 VALUES(0, '17', '2025-04-17', 0.25, '2025-04-21', '2025-04-18', 'FALSE'),
(1, '2', '2025-02-01', 0, '2025-02-11', '2025-02-09', 'FALSE'),
(2, '18', '2025-04-23', 0.05, '2025-05-02', '2025-04-30', 'FALSE'),
(3, '30', '2025-04-27', 0, '2025-05-04', '2025-05-02', 'FALSE'),
(4, '33', '2025-01-09', 0, '2025-01-13', '2025-01-11', 'FALSE'),
(5, '8', '2025-03-09', 0, '2025-03-15', '2025-03-14', 'FALSE'),
(6, '26', '2025-02-27', 0.1, '2025-03-04', '2025-03-04', 'FALSE'),
(7, '4', '2025-01-25', 0, '2025-01-27', '2025-01-26', 'FALSE'),
(8, '24', '2025-03-13', 0.25, '2025-03-16', '2025-03-14', 'FALSE'),
(9, '33', '2025-05-01', 0, '2025-05-09', '2025-05-08', 'FALSE'),
(10, '7', '2025-01-29', 0.05, '2025-01-31', '2025-01-30', 'FALSE'),
(11, '30', '2025-02-07', 0, '2025-02-12', '2025-02-11', 'FALSE'),
(12, '9', '2025-01-29', 0.25, '2025-02-05', '2025-02-05', 'FALSE'),
(13, '11', '2025-03-17', 0, '2025-03-20', '2025-03-18', 'FALSE'),
(14, '25', '2025-03-08', 0.05, '2025-03-12', '2025-03-11', 'FALSE'),
(15, '28', '2025-04-06', 0, '2025-04-14', '2025-04-14', 'FALSE'),
(16, '10', '2025-02-28', 0.1, '2025-03-04', '2025-03-02', 'FALSE'),
(17, '18', '2025-01-27', 0.25, '2025-02-01', '2025-01-28', 'FALSE'),
(18, '0', '2025-02-17', 0, '2025-02-19', '2025-02-18', 'FALSE'),
(19, '13', '2025-01-29', 0.05, '2025-02-01', '2025-01-30', 'FALSE'),
(20, '21', '2025-01-30', 0, '2025-02-07', '2025-02-06', 'FALSE'),
(21, '3', '2025-02-14', 0, '2025-02-20', '2025-02-18', 'FALSE'),
(22, '31', '2025-04-09', 0.25, '2025-04-14', '2025-04-13', 'FALSE'),
(23, '11', '2025-02-20', 0, '2025-02-23', '2025-02-23', 'FALSE'),
(24, '20', '2025-01-21', 0, '2025-01-28', '2025-01-25', 'FALSE'),
(25, '13', '2025-03-17', 0, '2025-03-27', '2025-03-21', 'FALSE'),
(26, '18', '2025-01-14', 0, '2025-01-21', '2025-01-15', 'FALSE'),
(27, '1', '2025-01-23', 0.1, '2025-02-02', '2025-01-27', 'FALSE'),
(28, '19', '2025-02-21', 0.1, '2025-02-24', '2025-02-24', 'FALSE'),
(29, '22', '2025-03-07', 0, '2025-03-11', '2025-03-09', 'FALSE');

-- Product Category
INSERT INTO [dbo].[Product Category] (ProductCategoryID, CategoryName)
VALUES 
(0,'desk'),
(1,'chair'),
(2,'cupboard');

-- Products
INSERT INTO [dbo].[Products] (
    [ProductID],
    [ProductCategoryID],
    [ProductName],
    [ManufactureCost],
    [MaxDailyOutput],
    [SellPrice],
    [QuantityInStock],
    [ProductionLimit],
    [IsCanceled]
)VALUES
(0, 0, 'standing desk', 65, 130, 140, 8, 140, 'FALSE'),
(1, 0, 'gaming desk', 66, 132, 110, 6, 220, 'FALSE'),
(2, 1, 'office chair', 40, 64, 250, 5, 750, 'FALSE'),
(3, 1, 'gaming chair', 63, 101, 110, 5, 220, 'FALSE'),
(4, 2, 'cupboard', 68, 122, 120, 10, 360, 'FALSE');


-- order details
INSERT INTO [dbo].[Order Details] (OrderID, ProductID, Quantity)
VALUES
(0, 3, 2),
(0, 2, 5),
(0, 0, 2),
(1, 2, 2),
(1, 1, 5),
(1, 0, 5),
(2, 0, 4),
(3, 0, 1),
(3, 1, 2),
(3, 2, 2),
(4, 3, 4),
(4, 2, 1),
(5, 2, 3),
(5, 1, 3),
(5, 4, 2),
(6, 2, 3),
(6, 4, 3),
(7, 4, 5),
(7, 2, 2),
(7, 0, 4),
(8, 3, 5),
(8, 4, 5),
(8, 2, 1),
(9, 2, 2),
(9, 0, 2),
(9, 3, 1),
(10, 1, 5),
(10, 3, 1),
(11, 4, 2),
(11, 2, 5),
(11, 0, 2),
(12, 4, 5),
(12, 2, 5),
(13, 3, 5),
(13, 4, 3),
(14, 4, 2),
(14, 2, 2),
(15, 0, 5),
(15, 2, 2),
(16, 3, 3),
(16, 0, 1),
(16, 2, 3),
(17, 2, 4),
(17, 4, 5),
(18, 2, 4),
(18, 3, 3),
(18, 1, 4),
(19, 1, 2),
(19, 4, 1),
(19, 2, 1),
(20, 3, 5),
(20, 1, 2),
(20, 2, 1),
(21, 0, 3),
(21, 4, 5),
(22, 4, 3),
(22, 0, 3),
(22, 1, 1),
(23, 3, 5),
(23, 2, 1),
(24, 0, 1),
(24, 3, 3),
(24, 4, 2),
(25, 1, 4),
(26, 2, 5),
(26, 0, 5),
(26, 1, 4),
(27, 1, 2),
(27, 4, 5),
(27, 0, 2),
(28, 1, 4),
(28, 2, 3),
(28, 3, 2),
(29, 0, 2),
(29, 3, 4),
(29, 4, 4);


-- Component Category
INSERT INTO [dbo].[Component Category] (ComponentCategoryID, CategoryName)
VALUES 
(0, 'wood'),
(1, 'metal'),
(2, 'other');

-- Components
INSERT INTO [dbo].[Components] (
    [ComponentID],
    [ComponentName],
    [QuantityInStock],
    [MaxQuantityInStock],
    [ComponentCategoryID],
    [ComponentCost]
)
VALUES
(0,'wooden plank',302,450,0,3.0),
(1,'metal bar',67,180,1,7.5),
(2,'screws',1205,3000,1,0.4),
(3,'rubber strap',160,600,2,6.0),
(4,'leather',55,360,2,6.0);

-- Components Required
INSERT INTO [dbo].[Components Required] ([ProductID],[ComponentID],[Amount])
VALUES
(0,2,6),
(0,3,1),
(0,4,5),
(1,0,1),
(1,1,9),
(1,2,8),
(2,0,5),
(2,1,3),
(2,2,1),
(2,3,3),
(2,4,8),
(3,3,3),
(3,4,6),
(4,0,5),
(4,1,7),
(4,2,6),
(4,3,3),
(4,4,6);