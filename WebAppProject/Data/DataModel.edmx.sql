
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/28/2016 12:57:46
-- Generated from EDMX file: C:\WebApi\WebAppProject\WebAppProject\Data\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LocalDataModelDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_InformationSystemTask]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DataTasks] DROP CONSTRAINT [FK_InformationSystemTask];
GO
IF OBJECT_ID(N'[dbo].[FK_TaskEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DataEvents] DROP CONSTRAINT [FK_TaskEvent];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[DataEvents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DataEvents];
GO
IF OBJECT_ID(N'[dbo].[DataTasks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DataTasks];
GO
IF OBJECT_ID(N'[dbo].[InformationSystems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InformationSystems];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'InformationSystems'
CREATE TABLE [dbo].[InformationSystems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ISType] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DataTasks'
CREATE TABLE [dbo].[DataTasks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TaskType] tinyint  NOT NULL,
    [Source] tinyint  NOT NULL,
    [Data] nvarchar(max)  NOT NULL,
    [Destination] nvarchar(max)  NOT NULL,
    [InformationSystem_Id] int  NULL
);
GO

-- Creating table 'DataEvents'
CREATE TABLE [dbo].[DataEvents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EventDateTime] datetime  NOT NULL,
    [TaskState] tinyint  NOT NULL,
    [Task_Id] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'InformationSystems'
ALTER TABLE [dbo].[InformationSystems]
ADD CONSTRAINT [PK_InformationSystems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DataTasks'
ALTER TABLE [dbo].[DataTasks]
ADD CONSTRAINT [PK_DataTasks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DataEvents'
ALTER TABLE [dbo].[DataEvents]
ADD CONSTRAINT [PK_DataEvents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Task_Id] in table 'DataEvents'
ALTER TABLE [dbo].[DataEvents]
ADD CONSTRAINT [FK_TaskEvent]
    FOREIGN KEY ([Task_Id])
    REFERENCES [dbo].[DataTasks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskEvent'
CREATE INDEX [IX_FK_TaskEvent]
ON [dbo].[DataEvents]
    ([Task_Id]);
GO

-- Creating foreign key on [InformationSystem_Id] in table 'DataTasks'
ALTER TABLE [dbo].[DataTasks]
ADD CONSTRAINT [FK_InformationSystemTask]
    FOREIGN KEY ([InformationSystem_Id])
    REFERENCES [dbo].[InformationSystems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InformationSystemTask'
CREATE INDEX [IX_FK_InformationSystemTask]
ON [dbo].[DataTasks]
    ([InformationSystem_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------