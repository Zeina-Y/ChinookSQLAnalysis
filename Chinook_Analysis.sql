
/*Question 1: IS there a Relationship between media type and sales?*/
/*This query retrieves the count of invoices for each media type.*/
/* It joins the MediaType, Track, and InvoiceLine tables to get the required data.*/

SELECT m.MediaTypeId, m.Name, COUNT(invl.InvoiceId) Number_of_Invoices
FROM MediaType m
JOIN Track tr ON tr.MediaTypeId = m.MediaTypeId
JOIN InvoiceLine invl ON invl.TrackId = tr.TrackId
GROUP BY 1, 2
ORDER BY 3 DESC ;


/*Question 2: What Percentages of Albums according to Sales? */
/*This query categorizes albums into high, mid, and low sales based on the amount spent.*/
/*It calculates the total amount spent on each album and then assigns a category based on the amount.*/

SELECT AlbumId, CASE WHEN AmountSpent > 14 THEN 'High'
    WHEN AmountSpent <= 14 AND AmountSpent > 7 THEN 'Mid'
    ELSE 'Low' END AS Sale_cat
FROM (SELECT alb.AlbumId, SUM(invl.UnitPrice * invl.Quantity) AmountSpent
FROM Album alb
JOIN Track tr ON alb.AlbumId = tr.AlbumId
JOIN InvoiceLine invl ON invl.TrackId = tr.TrackId
GROUP BY 1
ORDER BY 2 DESC) sales_album ;


/*Question 3: What are general trends in genres for the top 5 countries in invoice numbers?*/
/*This query identifies the top 3 genres in the top 5 countries by invoice number.*/
/*It uses CTEs to first find the top 5 countries and then to rank genres within those countries.*/

WITH top_country AS ( SELECT c.Country, COUNT(inv.InvoiceId)
FROM Customer c
JOIN Invoice inv
ON inv.CustomerId = c.CustomerId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5 ) ,
top_country_genre AS (SELECT c.Country, g.Name, COUNT(invl.InvoiceId) Invoices,
 DENSE_RANK() OVER (PARTITION BY c.Country ORDER BY COUNT(invl.InvoiceId) DESC) invoice_rank
FROM Customer c
JOIN Invoice inv ON inv.CustomerId = c.CustomerId
JOIN InvoiceLine invl ON invl.InvoiceId = inv.InvoiceId
JOIN Track tr ON tr.TrackId = invl.TrackId
JOIN Genre g ON g.GenreID = tr.GenreID
GROUP BY 1, 2
HAVING c.Country IN (SELECT Country FROM top_country)
ORDER BY 1, 3 DESC )
SELECT Country, Name, Invoices
FROM top_country_genre
GROUP BY 1,2
HAVING invoice_rank = 1 OR invoice_rank = 2 OR invoice_rank = 3
ORDER BY 1, 3 DESC;


/*Question 4: Is there a Relationship between a customer being in a company and sales?*/
/*This query examines the average invoice total for customers who are associated with a company versus those who are not.*/
/*It categorizes customers based on whether the company field is null and then calculates the average total.*/

SELECT t1.Company_status, AVG(inv.Total)
FROM Invoice inv
JOIN
 (SELECT CustomerId, CASE WHEN COMPANY IS NULL THEN 'No_Company'
        ELSE 'Company' END AS Company_status
  FROM Customer ) t1
ON t1.CustomerId = inv.CustomerId
GROUP BY 1 ;
