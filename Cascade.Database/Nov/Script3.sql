USE [CascadeDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_PortfolioOwnerReport]    Script Date: 11/14/2012 13:42:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PortfolioOwnerReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PortfolioOwnerReport]
GO

/****** Object:  StoredProcedure [dbo].[sp_PortfolioWorkStationDescriptionReport]    Script Date: 11/14/2012 13:42:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PortfolioWorkStationDescriptionReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PortfolioWorkStationDescriptionReport]
GO


Create Procedure [dbo].[sp_PortfolioOwnerReport]
As
Select Count(p.ACCOUNT) As [Count], p.PortfolioOwner 
From dbo.TBL_Portfolio p
Group By p.PortfolioOwner;
GO


Create Procedure [dbo].[sp_PortfolioWorkStationDescriptionReport]
As
Select Count(p.ACCOUNT) As [Count], p.WorkStatusDescription 
From dbo.TBL_Portfolio p
Group By p.WorkStatusDescription;
GO

INSERT INTO [CascadeDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
VALUES ('Work Status Breakdown ','Pie3D.swf','WorkStatusBreakdown','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'200' ,'1' );
GO

INSERT INTO [CascadeDB].[dbo].[TBL_CHART] ([Caption],[SWFile], [ChartID], [TypeOfChart] ,[CanvasBgColor] ,[CanvasBgAlpha] ,[ShowLegend] ,[NumberSuffix] ,[PieRadius] ,[EnableRotation] )
VALUES ('Portfolio Owner Breakdown ','Pie3D.swf','PortfolioOwnerBreakdown','PieChart', 'FFFFFF' ,'100' ,'1' ,'%' ,'200' ,'1' );
GO