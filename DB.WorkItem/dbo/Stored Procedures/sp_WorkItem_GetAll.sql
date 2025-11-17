CREATE PROCEDURE sp_WorkItem_GetAll
    @PageNumber INT = 1
AS
BEGIN
    SET NOCOUNT ON;

    IF @PageNumber < 1
        SET @PageNumber = 1;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = '
        SELECT Id, Title, Description, CreatedAt, LastUpdatedAt
        FROM WorkItems
        ORDER BY LastUpdatedAt DESC
        OFFSET ' + CAST((@PageNumber - 1) * 10 AS NVARCHAR(10)) + ' ROWS
        FETCH NEXT 10 ROWS ONLY;';

    EXEC sp_executesql @SQL;

    DECLARE @TotalCount INT;
    SELECT @TotalCount = COUNT(*) FROM WorkItems;

    DECLARE @TotalPages INT = CEILING(@TotalCount / 10.0);

    SELECT @TotalPages AS TotalPages;
END