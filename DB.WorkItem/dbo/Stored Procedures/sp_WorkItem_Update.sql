CREATE PROCEDURE dbo.sp_WorkItem_Update
    @Id INT,
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.WorkItems
    SET Title = @Title,
        Description = @Description,
        LastUpdatedAt = SYSUTCDATETIME()
    WHERE Id = @Id;

    SELECT @@ROWCOUNT AS RowsAffected;
END