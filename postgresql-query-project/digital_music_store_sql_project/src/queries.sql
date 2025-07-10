--Query 1:
--The question I wanted to answer with this query is, "What are the Top 3 Records by highest average track length?"

SELECT TOP 3
    Album.Title AS AlbumTitle,
    AVG(Track.Milliseconds) / 60000.0 AS AvgTrackLength_Minutes
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Album.AlbumId, Album.Title
ORDER BY AvgTrackLength_Minutes DESC;

--Query 2:
--The question I wanted to answer with this query is, "Who are the Lowest Performing Artists
--by Record Sales?"

SELECT 
    Artist.Name AS ArtistName,
    SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS TotalRevenue
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistId, Artist.Name
ORDER BY TotalRevenue ASC
LIMIT 5;

--Query 3:
--The question I wanted to answer with this query is, "Who are the Top customers by
--the Total Purchase Amaount?"

SELECT 
    Customer.CustomerId,
    Customer.FirstName || ' ' || Customer.LastName AS FullName,
    SUM(Invoice.Total) AS TotalSpent
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;

--Query 4:
--The question I wanted to answer with this query is, "How many tracks have the top 10 artists released?"

SELECT 
    Artist.Name AS ArtistName,
    COUNT(Track.TrackId) AS TrackCount
FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.ArtistId
ORDER BY TrackCount DESC
LIMIT 10;


