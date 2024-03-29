IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '$(Databasename)')

	CREATE DATABASE [$(Databasename)]
	GO
	USE [master]
	GO
	IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = '$(Username)')
	
		CREATE LOGIN [$(Username)] WITH PASSWORD=N'$(Password)', DEFAULT_DATABASE=[$(Databasename)], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
		GO
		USE [$(Databasename)]
		GO
		CREATE USER [$(Username)] FOR LOGIN [$(Username)]
		GO
		USE [$(Databasename)]
		GO
		ALTER ROLE [db_datareader] ADD MEMBER [$(Username)]
		GO
		USE [$(Databasename)]
		GO
		ALTER ROLE [db_datawriter] ADD MEMBER [$(Username)]
		GO
		USE [$(Databasename)]
		GO
		ALTER ROLE [db_owner] ADD MEMBER [$(Username)]
		GO
		USE [$(Databasename)]
		GO
		ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [$(Username)]
		GO
		USE [$(Databasename)]
		GO
		ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [$(Username)]
		GO
		USE [$(Databasename)]
		GO
		ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [$(Username)]
		GO