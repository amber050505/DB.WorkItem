CREATE PROCEDURE dbo.sp_WorkItem_Merge
    @Id INT = NULL,
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @Now DATETIME2 = SYSUTCDATETIME();

    MERGE dbo.WorkItems AS Target
        USING (SELECT @Id AS Id, @Title AS Title, @Description AS Description) AS Source
        ON Target.Id = Source.Id
    WHEN MATCHED THEN
        UPDATE SET
            Target.Title = Source.Title,
            Target.Description = Source.Description,
            Target.LastUpdatedAt = @Now
    WHEN NOT MATCHED THEN
        INSERT (Title, Description, CreatedAt, LastUpdatedAt)
        VALUES (Source.Title, Source.Description, @Now, @Now);
    
	DECLARE @RowsAffected INT = @@ROWCOUNT;
    IF EXISTS (SELECT 1 FROM dbo.WorkItems WHERE Id = @Id)
        SELECT @RowsAffected AS RowsAffected;
    ELSE
        SELECT SCOPE_IDENTITY() AS NewId;
END