-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[restoreERP](
	-- Add the parameters for the stored procedure here
	@FlagDir varchar(255), 
	@BackupDir varchar(255),
	@CompleteFileName varchar(255),
	@StopFileName varchar(255),
	@BaseName varchar(255),
	@logic_Name_Datebase varchar(255),
	@DatebasePath varchar(255),
	@logic_Name_Log varchar(255),
	@LogPath varchar(255)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @FileNameComplete varchar(255)
	DECLARE @FileNameStop varchar(255)
	
	DECLARE @File_Complete_Exists int
	DECLARE @File_Stop_Exists int
 
	SET @FileNameComplete= @FlagDir+@CompleteFileName --'D:\srv-db-4_bak\completeUpload.txt'
	EXEC Master.dbo.xp_fileexist @FileNameComplete, @File_Complete_Exists OUT

	SET @FileNameStop=@FlagDir+@StopFileName--'D:\srv-db-4_bak\stop.txt'
	EXEC Master.dbo.xp_fileexist @FileNameStop, @File_Stop_Exists OUT

	--USE [master]
	IF @File_Complete_Exists = 1 AND @File_Stop_Exists=0

	begin	
		Declare @BackupFile varChar(255)
		Declare @cmdText varChar(255)
	--	Declare @BKFolder varchar(255)

		set @BackupFile = null
		set @cmdText = null
	--	set @BKFolder = 'D:\srv-db-4_bak\base\base\'


		create table #FileList1 (
		FileName varchar(255),
		DepthFlag int,
		FileFlag int
		)


		--get all the files and folders in the backup folder and put them in temporary table
		insert into #FileList1 exec xp_dirtree @BackupDir,0,1
		--select * from #filelist

		--get the latest backup file name
		select top 1 @BackupFile = @BackupDir + FileName from #FileList1 where Filename like '%.bak' order by filename desc
		select @BackupFile


		--kick off current users/processes
		exec('ALTER DATABASE ['+@BaseName+']') --ErpCopy
		exec('SET SINGLE_USER WITH ROLLBACK IMMEDIATE;')


		--execute the restore
		exec('
		RESTORE DATABASE ['+@BaseName+'] FROM  DISK = ''' + @BackupFile + '''
		WITH  MOVE N'+@DatebasePath+' TO N' + @DatebasePath +', MOVE N'+@logic_Name_Log+' TO N'+@LogPath+',  NOUNLOAD,  REPLACE')


		--Let people/processes back in!
		exec('ALTER DATABASE ['+@BaseName+']') --ErpCopy
		exec('SET MULTI_USER WITH ROLLBACK IMMEDIATE;')
 
	end

	else
	begin
	print 'stop.txt='
	print @File_Stop_Exists
	print ' completeupload.txt='
	print @File_Complete_Exists
	end

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
END
GO



exec [BASE_SERVICE].[dbo].[restoreERP] @FlagDir='D:\srv-db-4_bak\', 
@BackupDir='D:\srv-db-4_bak\base\base\', 
@CompleteFileName='completeUpload.txt', 
@StopFileName='stop.txt', 
@BaseName='ErpCopy', 
@logic_Name_Datebase='base', 
@DatebasePath='D:\Base\ErpCopy.mdf', 
@logic_Name_Log='base_Log', 
@LogPath='C:\log\ErpCopy_log.ldf'