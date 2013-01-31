/*
Executed on server 139/dbPCS
*/
USE [CascadeDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDistinctProductCode]    Script Date: 01/25/2013 14:33:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDistinctProductCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetDistinctProductCode]
GO

USE [CascadeDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDistinctProductCode]    Script Date: 01/25/2013 14:33:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[sp_GetDistinctProductCode]
As
Select distinct Product_Code From RACCOUNT (nolock) Order By 1;

GO

