#1
select max(quantity), count(*)
from tr_orderdetails;

#2
select distinct(ProductID),Quantity from tr_orderdetails where Quantity =3 order by ProductID asc, Quantity desc;

#3
select distinct PropertyID from tr_orderdetails;
select count(distinct PropertyID) from tr_orderdetails;

-- =============  --

#4
select ProductCategory, count(*) as count 
from tr_products 
group by ProductCategory
order by count desc;

#5
select PropertyState, count(*) as count
from tr_propertyinfo
group by PropertyState
order by count desc;

#6
select ProductID, sum(Quantity) as Total_Quantity
from tr_orderdetails
group by ProductID
order by Total_Quantity desc
Limit 5;

#7
select PropertyID, sum(Quantity) as Total_Quantity
from tr_orderdetails
group by PropertyID
order by Total_Quantity desc
Limit 5;

#8
select ProductName, sum(Quantity) as Total_Quantity
from tr_orderdetails,tr_products
where  tr_orderdetails.ProductID = tr_products.ProductID
group by ProductName
order by Total_Quantity desc
Limit 5;

-- another method of Join, here
select ProductName, sum(Quantity) as Total_Quantity
from tr_orderdetails as o 
left join tr_products as p 
on  o.ProductID = p.ProductID
group by ProductName
order by Total_Quantity desc
Limit 5;

#8.1
select p.ProductName, sum(Quantity * Price) as Sales
from tr_orderdetails as o 
left join tr_products as p 
on  o.ProductID = p.ProductID
group by ProductName
order by Sales desc
Limit 5;

#9
select pi.PropertyCity,p.ProductName, sum(Quantity * Price) as Sales
from tr_orderdetails as o 
left join tr_products as p on  o.ProductID = p.ProductID
left join tr_propertyinfo as pi on  o.PropertyID = pi.`Prop ID`
where pi.PropertyCity = 'Arlington'
group by pi.PropertyCity, p.ProductName
order by Sales desc
Limit 5;

#9.1
select pi.PropertyState,p.ProductName, sum(Quantity * Price) as Sales
from tr_orderdetails as o 
left join tr_products as p on  o.ProductID = p.ProductID
left join tr_propertyinfo as pi on  o.PropertyID = pi.`Prop ID`
where pi.PropertyState = 'New York'
group by pi.PropertyState, p.ProductName
order by Sales desc
Limit 5;

