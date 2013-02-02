CREATE TABLE [dbo].[TBL_CHART](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfChart] [varchar](100) NOT NULL,
	[Caption] [varchar](500) NOT NULL,
	[SWFile] [varchar](500) NOT NULL,
	[ChartID] [varchar](500) NOT NULL,
	[NumberSuffix] [char](1) NULL,
	[SNumberSuffix] [char](1) NULL,
	[XaxisName] [varchar](500) NULL,
	[YaxisName] [varchar](500) NULL,
	[CanvasBgColor] [char](6) NULL,
	[BgColor] [char](6) NULL,
	[CanvasBgAlpha] [varchar](10) NULL,
	[BgAlpha] [varchar](10) NULL,
	[PieRadius] [varchar](10) NULL,
	[EnableRotation] [char](1) NULL,
	[ShowLegend] [char](1) NULL,
	[ShowLabels] [char](1) NULL,
	[PlotGradientColor] [char](6) NULL,
	[DrillLevelChartIDs] [varchar] (MAX) NULL,
	[IsActive] [bit] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastCreatedDate] [datetime] NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
	[LastCreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TBL_CHART] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_Active]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_EnableRotation]  DEFAULT ((0)) FOR [EnableRotation]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_LastCreatedDate]  DEFAULT (getdate()) FOR [LastCreatedDate]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_ShowLabels]  DEFAULT ((0)) FOR [ShowLabels]
GO

ALTER TABLE [dbo].[TBL_CHART] ADD  CONSTRAINT [DF_TBL_CHART_ShowLegend]  DEFAULT ((0)) FOR [ShowLegend]
GO

		
INSERT INTO [dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha])      
VALUES ('Media Payble(By Month)' ,'MSColumn3D.swf','MediaPayble','Chart','Media Payble Quantity' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100');
GO

INSERT INTO [dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha])      
VALUES ('Media Paid by Our Check(By Month)' ,'MSColumn3D.swf','MediaPaidByCheck','Chart','Media Paid Amount ($000)' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100');
GO

INSERT INTO [dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[YaxisName] ,[CanvasBgColor] ,[BgColor] ,[CanvasBgAlpha] ,[BgAlpha])      
VALUES ('Not Submitted - No Date Submitted (By Month)' ,'MSColumn3D.swf','NotSubmittedNodateSubmit','Chart','Not Submitted Amount' ,'FFFFFF' ,'FFFFFF' ,'100' ,'100');
GO

INSERT INTO [dbo].[TBL_CHART]([Caption],[SWFile], [ChartID], [TypeOfChart],[YaxisName],[CanvasBgColor],[BgColor],[CanvasBgAlpha])
VALUES ('Not Submitted - No Date Confirmed (By Seller)','Column3D.swf','NotSubmittedNodateConfirm','BarChart','Average Quantity','FFFFFF','FFFFFF','100');
GO

DECLARE @CurrentTime DATETIME
declare @user_Name NVARCHAR(256)
declare @_email NVARCHAR(256)
DECLARE @User_Id uniqueidentifier
SET @CurrentTime = GetDate();

set @user_Name = 'mmerz'--firstname.lastname
set @_email = 'mmerz@cascadereceivables.com'
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'CascadeWeb', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
PRINT CAST(@User_Id AS VARCHAR(50))	

SET @User_Id = NULL;

set @user_Name = 'bthakkar'--firstname.lastname
set @_email = 'bthakkar@gmail.com'
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'CascadeWeb', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
PRINT CAST(@User_Id AS VARCHAR(50))	
SET @User_Id = NULL;

set @user_Name = 'adarling'--firstname.lastname
set @_email = 'adarling@msi.com'
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'CascadeWeb', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
PRINT CAST(@User_Id AS VARCHAR(50))	

SET @User_Id = NULL;

set @user_Name = 'pdarling'--firstname.lastname
set @_email = 'pdarling@msi.com'
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'CascadeWeb', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
PRINT CAST(@User_Id AS VARCHAR(50))	