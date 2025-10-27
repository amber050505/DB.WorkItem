CREATE PROCEDURE dbo.sp_WorkItem_GetById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Title, Description, CreatedAt, LastUpdatedAt
    FROM dbo.WorkItems WHERE Id = @Id;
END