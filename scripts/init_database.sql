/*

======================================
Create Database and Schema
======================================
Script Purpose: 
This scripts creates a new database names 'DataWarehouse' after checking if it already exists. 
If the database exists, it is dropped and recreated. Additionally, the sripct sets up three schemas within the database: 'bronze', 'silver' and 'gold'

WARNING: 
Running this script will drop the entire 'DataWarehouse' databse if it exists. 
All data in the database will be permently deleted. Proceed with caution and
ensure you have proper backups before running this script. 

*/

USE master;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

-- Drop an recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database
Create DATABASE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
