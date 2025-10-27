CREATE PROCEDURE dbo.sp_WorkItem_Create
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Now DATETIME2 = SYSUTCDATETIME();

    INSERT INTO dbo.WorkItems (Title, Description, CreatedAt, LastUpdatedAt)
    VALUES (@Title, @Description, @Now, @Now);

    SELECT SCOPE_IDENTITY() AS NewId;
END