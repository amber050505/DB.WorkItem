CREATE PROCEDURE sp_WorkItem_GetAll
    @SortOrder NVARCHAR(4) = 'DESC'
AS
BEGIN
    SET NOCOUNT ON;

    IF @SortOrder NOT IN ('ASC', 'DESC')
        SET @SortOrder = 'DESC';

    DECLARE @sql NVARCHAR(MAX);

    SET @sql = '
        SELECT Id, Title, Description, CreatedAt, LastUpdatedAt
        FROM WorkItems
        ORDER BY LastUpdatedAt ' + @SortOrder;

    EXEC sp_executesql @sql;
END