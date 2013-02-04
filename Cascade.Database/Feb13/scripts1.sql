ALTER TABLE MSI_ComplaintMain ADD IsViewedByAgency [bit] NULL;
GO

EXEC [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'jshah', @RoleNames = 'agency'
EXEC [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'adarling', @RoleNames = 'agency'
EXEC [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'pdarling', @RoleNames = 'agency'
EXEC [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'bthakkar', @RoleNames = 'agency'
EXEC [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] @ApplicationName = 'CascadeWeb', @UserNames = 'mmerz', @RoleNames = 'agency'