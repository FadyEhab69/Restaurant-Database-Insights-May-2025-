use restaurant_db;
-- من الداتا الخاصة ب المطعم اية الاسئلة اللي ممكن نجاوب عليها 
-- 1/ view the menu_items on the menu.
select * from menu_items;
-- 2/ find the number of items on the menu.
select count(*) from menu_items;
-- 3/ what are the most expensive and least items on the menue ?
select * from menu_items order by price; 
-- يبقا اقل طبق هو edamame
select * from menu_items order by price desc;
-- و اغلي طبق هو shrimp scampi
-- 4/ how many italian dishes are on the menu ?
select count(*) from menu_items where category 
= 'italian';
-- 5/ what are the most expensive and least italian items on the menue ?
select * from menu_items 
where category = 'italian'
order by price;  

select * from menu_items 
where category = 'italian'
order by price desc;
-- 6/ how many dishes are in each categ ?
select category, count(menu_item_id) as num_of_dishes
from menu_items 
group by category;
-- 7/ what is the avg dish price in each categ ?
select category, avg(menu_item_id) as avg_of_dishes
from menu_items 
group by category; 

-- 8/ view the order_details table 
select * from order_details;
-- order_details_id هو ال prim key 
-- order_id معني عمود دي ان الاوردر اللي يحمل رقم 2 اطلب 5 مرات
-- 9/ what is the date range of the table ?
select * from order_details 
order by order_date ;

select min(order_date) 
from order_details ;

select max(order_date) 
from order_details ;
-- 10/ how many orders were made it in this data range ?
select count(distinct order_id) from order_details ;
-- 11/ how many items were ordered in this data range ?
select count(*) from order_details ;
-- 12/ which orders had the most number of items ?
select order_id,count(item_id) as num_items
 from order_details 
group by order_id
order by num_items desc;
-- 13/ how many orders had more than 10 items ?
select count(*) from
(select order_id,count(item_id) as num_items
 from order_details 
group by order_id
having num_items > 10) as num_orders;
-- 14/ combine menu_items & order_details into a single table 
select * from menu_items;
select * from order_details;

select * 
from order_details od inner join menu_items mi
on od.order_id = mi.menu_item_id;
-- 15/ what were the most and least ordered items ?

select item_name,count(order_details_id) as num_purchaes
from order_details od inner join menu_items mi
on od.order_id = mi.menu_item_id
group by item_name
order by num_purchaes desc;

-- 16/ what categ were they in ?

select item_name,category,count(order_details_id) as num_purchaes
from order_details od inner join menu_items mi
on od.order_id = mi.menu_item_id
group by item_name,category
order by num_purchaes desc;

-- 17/ what were the top 5 orders that spend the most money ?
select order_id , sum(price) as total_spend
from order_details od inner join menu_items mi
on od.order_id = mi.menu_item_id
group by order_id
order by total_spend desc 
limit 5;
-- 18/ view the details of the highest spend order ,what insights can you gather from the ques ?

select category, count(item_id) as num_items
from order_details od inner join menu_items mi
on od.order_id = mi.menu_item_id
where order_id = 130
group by category;

-- لازم نخلي الاطباق الايطالي في المنيو
-- 19/ view the details of the top 5 highest spend order ,what insights can you gather from the ques ?

select order_id, category, count(item_id) as num_items
from order_details od inner join menu_items mi
on od.order_id = mi.menu_item_id
where order_id in (130, 131, 110, 109, 107)
group by order_id, category;

-- لازم نخلي الاطباق الايطالي في المنيو
