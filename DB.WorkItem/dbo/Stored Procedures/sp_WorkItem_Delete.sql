CREATE PROCEDURE dbo.sp_WorkItem_Delete
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.WorkItems WHERE Id = @Id;
    SELECT @@ROWCOUNT AS RowsAffected;
END