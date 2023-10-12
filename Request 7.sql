/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/


select monthname(m.date) as month ,m.fiscal_year as year,
	  round(sum((g.gross_price*m.sold_quantity))/1000000,2)as Gross_Sales_Amount_mln
	   from fact_sales_monthly m
       join fact_gross_price g
       on m.fiscal_year = g.fiscal_year
       join dim_customer c 
       on c.customer_code = m.customer_code
       where c.customer="Atliq Exclusive"
       group by month,year;