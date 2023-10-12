/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/


with x as
	(select c.channel, round(sum((g.gross_price*s.sold_quantity))/1000000,2) as Gross_price_mln
    from fact_sales_monthly s 
    join fact_gross_price g 
    on s.fiscal_year=g.fiscal_year and s.product_code=g.product_code
    join dim_customer c 
    on c.customer_code = s.customer_code 
    group by c.channel)
	select channel,Gross_price_mln,round((Gross_price_mln*100)/sum(Gross_price_mln) over(),2) as Percentage
    from x
    order by Percentage desc;