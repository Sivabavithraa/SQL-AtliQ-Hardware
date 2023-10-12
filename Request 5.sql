/*5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/


select  p.product_code,p.product,f.manufacturing_cost
      from fact_manufacturing_cost f
      join dim_product p 
	  on p.product_code=f.product_code
      where manufacturing_cost in ((select max(manufacturing_cost) from fact_manufacturing_cost), 
								   (select min(manufacturing_cost) from fact_manufacturing_cost))