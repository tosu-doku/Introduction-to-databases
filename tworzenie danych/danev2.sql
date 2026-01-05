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
    [CustomerID],
    [OrderDate],
    [Discount],
    [RequiredDate],
    [CompletedDate],
    [IsCanceled]
)
 VALUES
('4', '2026-01-02', 0.25, '2026-01-08', NULL, 'FALSE'),
('16', '2026-01-04', 0, '2026-01-06', NULL, 'FALSE'),
('27', '2026-01-11', 0, '2026-01-20', NULL, 'FALSE'),
('0', '2026-01-12', 0, '2026-01-17', NULL, 'FALSE'),
('9', '2026-01-14', 0.25, '2026-01-17', NULL, 'TRUE'),
('24', '2026-01-21', 0.25, '2026-01-24', NULL, 'FALSE'),
('15', '2026-01-21', 0, '2026-01-25', NULL, 'FALSE'),
('25', '2026-01-24', 0.05, '2026-01-30', NULL, 'FALSE'),
('18', '2026-01-26', 0.05, '2026-02-04', NULL, 'FALSE'),
('16', '2026-02-02', 0.1, '2026-02-12', NULL, 'FALSE'),
('17', '2026-02-05', 0, '2026-02-08', NULL, 'FALSE'),
('33', '2026-02-10', 0, '2026-02-12', NULL, 'FALSE'),
('1', '2026-02-12', 0, '2026-02-17', NULL, 'FALSE'),
('20', '2026-02-13', 0, '2026-02-18', NULL, 'FALSE'),
('29', '2026-02-24', 0.1, '2026-03-04', NULL, 'FALSE'),
('22', '2026-02-27', 0.1, '2026-03-07', NULL, 'FALSE'),
('1', '2026-03-06', 0, '2026-03-11', NULL, 'FALSE'),
('3', '2026-03-11', 0, '2026-03-14', NULL, 'FALSE'),
('33', '2026-03-16', 0, '2026-03-26', NULL, 'FALSE'),
('18', '2026-03-18', 0, '2026-03-26', NULL, 'FALSE'),
('2', '2026-03-19', 0.25, '2026-03-25', NULL, 'FALSE'),
('2', '2026-03-26', 0.1, '2026-03-29', NULL, 'FALSE'),
('5', '2026-03-28', 0.1, '2026-04-07', NULL, 'FALSE'),
('29', '2026-03-30', 0.1, '2026-04-04', NULL, 'FALSE'),
('1', '2026-04-07', 0.25, '2026-04-10', NULL, 'FALSE'),
('7', '2026-04-08', 0.05, '2026-04-18', NULL, 'FALSE'),
('19', '2026-04-08', 0.1, '2026-04-15', NULL, 'FALSE'),
('17', '2026-04-09', 0, '2026-04-19', NULL, 'FALSE'),
('29', '2026-04-10', 0.05, '2026-04-20', NULL, 'FALSE'),
('14', '2026-04-14', 0, '2026-04-21', NULL, 'FALSE'),
('12', '2026-04-16', 0.05, '2026-04-22', NULL, 'FALSE'),
('28', '2026-04-17', 0, '2026-04-22', NULL, 'FALSE'),
('34', '2026-04-17', 0.05, '2026-04-21', NULL, 'FALSE'),
('3', '2026-04-22', 0, '2026-04-30', NULL, 'FALSE'),
('26', '2026-04-25', 0.25, '2026-05-03', NULL, 'FALSE'),
('34', '2026-04-27', 0.25, '2026-05-06', NULL, 'FALSE'),
('33', '2026-04-27', 0.1, '2026-04-29', NULL, 'FALSE'),
('6', '2026-04-30', 0.1, '2026-05-02', NULL, 'FALSE'),
('31', '2026-04-30', 0, '2026-05-02', NULL, 'FALSE'),
('17', '2026-05-01', 0, '2026-05-07', NULL, 'FALSE');

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
(48, 0, 2),
(48, 1, 3),
(49, 0, 2),
(49, 2, 2),
(49, 1, 3),
(50, 2, 1),
(50, 3, 3),
(50, 4, 2),
(51, 2, 2),
(51, 4, 4),
(52, 1, 1),
(52, 4, 5),
(52, 2, 2),
(53, 1, 5),
(53, 0, 3),
(53, 3, 1),
(54, 3, 4),
(54, 4, 5),
(55, 3, 3),
(56, 4, 5),
(56, 1, 4),
(56, 2, 1),
(57, 3, 3),
(57, 4, 2),
(58, 4, 4),
(58, 0, 2),
(58, 3, 4),
(59, 0, 2),
(59, 4, 5),
(59, 3, 1),
(60, 0, 2),
(60, 4, 3),
(60, 1, 5),
(61, 0, 1),
(61, 2, 5),
(62, 3, 1),
(62, 0, 1),
(63, 3, 1),
(63, 1, 4),
(63, 2, 2),
(64, 2, 2),
(64, 0, 2),
(64, 1, 4),
(65, 4, 3),
(65, 2, 3),
(65, 0, 4),
(66, 0, 5),
(66, 3, 2),
(66, 4, 3),
(67, 1, 1),
(67, 2, 5),
(67, 3, 2),
(68, 0, 4),
(68, 2, 5),
(68, 4, 2),
(69, 1, 3),
(69, 0, 1),
(69, 3, 4),
(70, 3, 1),
(70, 2, 4),
(71, 2, 5),
(71, 3, 5),
(72, 0, 3),
(72, 1, 5),
(73, 2, 1),
(73, 1, 5),
(73, 3, 5),
(74, 0, 2),
(74, 2, 3),
(75, 4, 5),
(75, 1, 1),
(76, 2, 3),
(76, 0, 2),
(76, 3, 1),
(77, 1, 4),
(77, 2, 5),
(78, 2, 4),
(78, 3, 1),
(79, 1, 1),
(79, 3, 3),
(79, 0, 2),
(80, 2, 1),
(80, 3, 5),
(80, 4, 3),
(81, 2, 3),
(81, 0, 1),
(81, 1, 5),
(82, 4, 3),
(82, 3, 1),
(83, 1, 1),
(83, 2, 1),
(83, 3, 5),
(84, 4, 2),
(84, 1, 5),
(84, 3, 5),
(85, 0, 2),
(85, 3, 1),
(86, 1, 5),
(86, 3, 4),
(86, 2, 3),
(87, 0, 2),
(87, 3, 1);


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