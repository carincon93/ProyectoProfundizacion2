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

/****** Object:  Table [dbo].[Dim_Anio] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Anio](
	[Anio_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Anio] [int] NOT NULL,
 CONSTRAINT [PK_Anio] PRIMARY KEY CLUSTERED 
(
	[Anio_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dim_Mes] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Mes](
	[Mes_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Mes] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Mes] PRIMARY KEY CLUSTERED 
(
	[Mes_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dim_Genero] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Genero](
	[Genero_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[Genero_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dim_Agrupacion] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Agrupacion](
	[Agrupacion_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Agrupacion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Agrupacion] PRIMARY KEY CLUSTERED 
(
	[Agrupacion_SKey] ASC
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
    [Genero_SKey] [int] NOT NULL,
    [Agrupacion_SKey] [int] NOT NULL,
    [Anio_SKey] [int] NOT NULL,
    [Mes_SKey] [int] NOT NULL,
    [Valor]  [decimal](13, 3) NOT NULL,
 CONSTRAINT [PK_Municipio_Stats] PRIMARY KEY CLUSTERED 
(
    [Municipio_SKey] ASC,
    [Indicador_SKey] ASC,
    [Categoria_SKey] ASC,
    [Genero_SKey] ASC,
    [Agrupacion_SKey] ASC,
    [Anio_SKey] ASC,
    [Mes_SKey] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Genero] FOREIGN KEY([Genero_SKey])
REFERENCES [dbo].[Dim_Genero] ([Genero_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Genero]
GO

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Agrupacion] FOREIGN KEY([Agrupacion_SKey])
REFERENCES [dbo].[Dim_Agrupacion] ([Agrupacion_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Agrupacion]
GO

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Anio] FOREIGN KEY([Anio_SKey])
REFERENCES [dbo].[Dim_Anio] ([Anio_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Anio]
GO

ALTER TABLE [dbo].[Municipio_Stats]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Stats_Dim_Mes] FOREIGN KEY([Mes_SKey])
REFERENCES [dbo].[Dim_Mes] ([Mes_SKey])
GO

ALTER TABLE [dbo].[Municipio_Stats] CHECK CONSTRAINT [FK_Municipio_Stats_Dim_Mes]
GO
