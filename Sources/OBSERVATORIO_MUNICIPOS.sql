USE master
GO

IF EXISTS(SELECT NAME FROM SYS.databases WHERE NAME='OBSERVATORIO_MUNICIPIOS')
BEGIN
	DROP DATABASE OBSERVATORIO_MUNICIPIOS
END
GO

CREATE DATABASE OBSERVATORIO_MUNICIPIOS
GO

USE OBSERVATORIO_MUNICIPIOS
GO

/****** Object:  Table [dbo].[Dim_Municipio] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Municipio](
	[Municipio_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Municipio_Nombre] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[Municipio_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dim_Indicador] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Indicador](
	[Indicador_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Indicador_Nombre] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Indicador] PRIMARY KEY CLUSTERED 
(
	[Indicador_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dim_Categoria] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Categoria](
	[Categoria_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_Nombre] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Dim_Categoria] PRIMARY KEY CLUSTERED 
(
	[Categoria_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Municipio_Stats] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Municipio_Stats](
	[Municipio_SKey] [int] NOT NULL,
	[Indicador_SKey] [int] NOT NULL,
	[Categoria_SKey] [int] NOT NULL,
	[Genero] [varchar](10) NULL,
	[Agrupacion] [varchar](20) NULL,
	[Valor]  [decimal](10, 8) NOT NULL,
	[Anio] [int] NOT NULL,
	[Mes] [varchar](20) NULL,
 CONSTRAINT [PK_Municipio_Stats] PRIMARY KEY CLUSTERED 
(
	[Municipio_SKey] ASC,
	[Indicador_SKey] ASC,
	[Categoria_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Municipio] FOREIGN KEY([Municipio_SKey])
REFERENCES [dbo].[Dim_Municipio] ([Municipio_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Municipio]
GO

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Indicador] FOREIGN KEY([Indicador_SKey])
REFERENCES [dbo].[Dim_Indicador] ([Indicador_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Indicador]
GO

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Categoria] FOREIGN KEY([Categoria_SKey])
REFERENCES [dbo].[Dim_Categoria] ([Categoria_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Categoria]
GO

