--Executed in 139/dbPCS 01/31/2013
DECLARE @CurrentTime DATETIME
SET @CurrentTime = GetDate()
--EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'jshah', @RoleNames = 'user', @CurrentTimeUtc = @CurrentTime;
--EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'jshah', @RoleNames = 'agency', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'adarling', @RoleNames = 'user', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'adarling', @RoleNames = 'agency', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'pdarling', @RoleNames = 'user', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'pdarling', @RoleNames = 'agency', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'bthakkar', @RoleNames = 'user', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'bthakkar', @RoleNames = 'agency', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'mmerz', @RoleNames = 'user', @CurrentTimeUtc = @CurrentTime;
EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'mmerz', @RoleNames = 'agency', @CurrentTimeUtc = @CurrentTime;

--EXEC [dbo].[aspnet_UsersInRoles_AddUsersToRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'agencyUser', @RoleNames = 'agency', @CurrentTimeUtc = @CurrentTime;