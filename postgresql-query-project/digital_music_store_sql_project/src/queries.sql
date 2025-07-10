--Query 1:
--The question I wanted to answer with this query is, "What are the Top 3 Records by highest average track length?"

SELECT 
    Album.Title AS AlbumTitle,
    AVG(Track.Milliseconds) / 60000.0 AS AvgTrackLength_Minutes
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Album.AlbumId, Album.Title
ORDER BY AvgTrackLength_Minutes DESC
LIMIT 3;

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
