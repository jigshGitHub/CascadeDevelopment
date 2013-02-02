--Executed in 139/dbPCS 01/31/2013
DECLARE @CurrentTime DATETIME
declare @user_Name NVARCHAR(256)
declare @_email NVARCHAR(256)
DECLARE @User_Id uniqueidentifier
SET @CurrentTime = GetDate();

set @user_Name = 'agencyUser'--firstname.lastname
set @_email = 'agencyUser@cascadereceivables.com'
EXEC [dbo].[aspnet_Membership_CreateUser] @ApplicationName = 'CascadeWeb', @UserName = @user_Name, @Password = N'DE5aG4DJKaWNAC6qtb9Ex1mw0YQ=', @PasswordSalt = N'CgWo/aHD6MDFG4AYqW/5wQ==', @Email = @_email, @PasswordQuestion = NULL, @PasswordAnswer = NULL, @IsApproved = 1, @CurrentTimeUtc = @CurrentTime, @CreateDate = @CurrentTime, @UniqueEmail = NULL, @PasswordFormat = 1, @UserId = @User_Id OUTPUT;
