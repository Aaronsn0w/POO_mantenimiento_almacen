
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/02/2020 17:17:22
-- Generated from EDMX file: C:\Users\Aaron\source\repo\POO_mantenimiento_almacen\Almacen_Final\Almacen_DBFirst\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AlmacenDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Clientes_TiposDeClientes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT [FK_Clientes_TiposDeClientes];
GO
IF OBJECT_ID(N'[dbo].[FK_Despachos_Clientes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Despachos] DROP CONSTRAINT [FK_Despachos_Clientes];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuarios_Permisos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Permisos];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Despachos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Despachos];
GO
IF OBJECT_ID(N'[dbo].[Permisos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Permisos];
GO
IF OBJECT_ID(N'[dbo].[Productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productos];
GO
IF OBJECT_ID(N'[dbo].[TiposDeClientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TiposDeClientes];
GO
IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Codigo] nchar(10)  NULL,
    [Nombres] nchar(50)  NULL,
    [Apellidos] nchar(100)  NULL,
    [Direccion] nchar(200)  NULL,
    [Telefono] nchar(11)  NULL,
    [Correo] nchar(50)  NULL,
    [IdTipoCliente] bigint  NOT NULL
);
GO

-- Creating table 'Despachos'
CREATE TABLE [dbo].[Despachos] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NULL,
    [TipoDeAccion] nchar(10)  NULL,
    [IdCliente] bigint  NOT NULL,
    [Contacto] nchar(10)  NULL,
    [DetalleDeProductos] nchar(100)  NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Nombre] nchar(10)  NULL,
    [Estado] nchar(10)  NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Codigo] nchar(10)  NULL,
    [FechaCreacion] datetime  NULL,
    [FechaVencimiento] datetime  NULL,
    [Nombre] nchar(50)  NULL,
    [Descripcion] nchar(200)  NULL,
    [UDM] nchar(10)  NULL,
    [Costo] decimal(18,0)  NULL,
    [Existencia] bigint  NULL,
    [Estado] nchar(10)  NULL
);
GO

-- Creating table 'TiposDeClientes'
CREATE TABLE [dbo].[TiposDeClientes] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Nombre] nchar(30)  NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Nombres] nchar(50)  NULL,
    [Apellidos] nchar(70)  NULL,
    [Email] nchar(30)  NULL,
    [Password] nchar(40)  NULL,
    [Rol] bigint  NOT NULL,
    [Estado] nchar(10)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Despachos'
ALTER TABLE [dbo].[Despachos]
ADD CONSTRAINT [PK_Despachos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TiposDeClientes'
ALTER TABLE [dbo].[TiposDeClientes]
ADD CONSTRAINT [PK_TiposDeClientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdTipoCliente] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_Clientes_TiposDeClientes]
    FOREIGN KEY ([IdTipoCliente])
    REFERENCES [dbo].[TiposDeClientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Clientes_TiposDeClientes'
CREATE INDEX [IX_FK_Clientes_TiposDeClientes]
ON [dbo].[Clientes]
    ([IdTipoCliente]);
GO

-- Creating foreign key on [IdCliente] in table 'Despachos'
ALTER TABLE [dbo].[Despachos]
ADD CONSTRAINT [FK_Despachos_Clientes]
    FOREIGN KEY ([IdCliente])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Despachos_Clientes'
CREATE INDEX [IX_FK_Despachos_Clientes]
ON [dbo].[Despachos]
    ([IdCliente]);
GO

-- Creating foreign key on [Rol] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_Usuarios_Permisos]
    FOREIGN KEY ([Rol])
    REFERENCES [dbo].[Permisos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuarios_Permisos'
CREATE INDEX [IX_FK_Usuarios_Permisos]
ON [dbo].[Usuarios]
    ([Rol]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------