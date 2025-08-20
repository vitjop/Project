-- Извлечение данных о продажах, клиентах, треках и жанрах
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    i.BillingCountry,
    i.BillingCity,
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    e.FirstName || ' ' || e.LastName AS EmployeeName,
    il.InvoiceLineId,
    il.TrackId,
    il.UnitPrice,
    il.Quantity,
    t.Name AS TrackName,
    a.Title AS AlbumTitle,
    ar.Name AS ArtistName,
    g.Name AS GenreName,
    mt.Name AS MediaTypeName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Artist ar ON a.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId
JOIN MediaType mt ON t.MediaTypeId = mt.MediaTypeId;