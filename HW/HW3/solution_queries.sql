select customername, sum(salesprice*quantity) as total_rev from dim_customer dc, fact_productsales fp, 
	where dc.customerid = fp.customerid 
	group by dc.customerid 
	order by total_rev desc 
	limit 1;

select salespersonname, sum(salesprice*quantity) as total_rev from fact_productsales fp, dim_salesperson ds 
	where ds.salespersonid = fp.salespersonid 
	group by ds.salespersonid 
	order by total_rev desc 
	limit 1;

select storename, sum(salesprice*quantity) as total_rev, year from fact_productsales fp, dim_store ds, dim_date dd 
	where fp.storeid = ds.storeid and fp.salesdatekey = dd.datekey 
	group by year, fp.storeid;

select storename, sum(salesprice*quantity) as sdv from fact_productsales fp, dim_store ds, dim_date dd 
	where fp.storeid = ds.storeid and fp.salesdatekey = dd.datekey and year = '2011' and monthname = 'September' 
	group by storename 
	order by sdv desc 
	limit 1;

select storename, sum(salesprice*quantity) as sdv, quarter from fact_productsales fp, dim_store ds, dim_date dd 
	where fp.storeid = ds.storeid and fp.salesdatekey = dd.datekey and year = '2016' and storename like '%Boulder%' 
	group by storename, quarter 
	order by quarter;