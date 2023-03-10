USE [master]
GO
/****** Object:  Database [examen]    Script Date: 18/2/2023 11:12:27 ******/
CREATE DATABASE [examen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'examen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\examen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'examen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\examen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [examen] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [examen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [examen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [examen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [examen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [examen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [examen] SET ARITHABORT OFF 
GO
ALTER DATABASE [examen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [examen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [examen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [examen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [examen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [examen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [examen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [examen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [examen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [examen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [examen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [examen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [examen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [examen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [examen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [examen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [examen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [examen] SET RECOVERY FULL 
GO
ALTER DATABASE [examen] SET  MULTI_USER 
GO
ALTER DATABASE [examen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [examen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [examen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [examen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [examen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [examen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'examen', N'ON'
GO
ALTER DATABASE [examen] SET QUERY_STORE = OFF
GO
USE [examen]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caja](
	[Id_Caja] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Maquina] [int] NOT NULL,
	[Ip_Maquina] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_Clientes] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Sexo] [varchar](20) NOT NULL,
	[Identidad] [bigint] NULL,
	[Telefono] [bigint] NULL,
	[Residencia_Actual] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Clientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes_Credito]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes_Credito](
	[Id_Clientes] [int] NULL,
	[Fecha_Inicio_Credito] [datetime] NOT NULL,
	[Total_A_Deber] [int] NOT NULL,
	[Cuotas_A_Pagar] [int] NOT NULL,
	[Fecha_Limite_Pagar] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLientes_Factura]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLientes_Factura](
	[Id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL,
	[Precio_Unitario] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total_Pagar] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLientes_Factura_Innovadora]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLientes_Factura_Innovadora](
	[Id_Factura_Inno] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_ProductoInnovador] [int] NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL,
	[Precio_Unitario] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total_Pagar] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Factura_Inno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Caja]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Caja](
	[Id_Detalles] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Apertura] [datetime] NOT NULL,
	[Fecha_Cierre] [datetime] NOT NULL,
	[Monto_Apertura] [int] NOT NULL,
	[Monto_Cierre] [int] NOT NULL,
	[Id_Caja] [int] NOT NULL,
	[Id_Usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Detalles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gastos_Productos]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastos_Productos](
	[Id_GastosProductos] [int] IDENTITY(1,1) NOT NULL,
	[Productos_Utilizado] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_Gasto] [datetime] NOT NULL,
	[Total_Gasto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_GastosProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otros_Gastos]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otros_Gastos](
	[Id_OtrosGastos] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Gasto] [varchar](50) NOT NULL,
	[Descripcion_Gasto] [varchar](50) NOT NULL,
	[Fecha_Gasto] [datetime] NOT NULL,
	[Total_Gasto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_OtrosGastos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NULL,
	[Nombre_Producto] [varchar](50) NOT NULL,
	[Descripcion_Producto] [varchar](50) NOT NULL,
	[Precio_Unitario] [int] NOT NULL,
	[Tipo_Moneda] [varchar](15) NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL,
	[Fecha_Venta] [datetime] NOT NULL,
	[Impuesto] [int] NOT NULL,
	[Precio_Compra] [int] NOT NULL,
	[Precio_Venta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Almacen]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Almacen](
	[Id_Almacen] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NULL,
	[Nombre_Producto] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_Ingresado] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Innovadores]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Innovadores](
	[Id_ProductoInnovador] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NULL,
	[Nombre_Producto] [varchar](50) NOT NULL,
	[Descripcion_Producto] [varchar](50) NOT NULL,
	[Precio_Unitario] [int] NOT NULL,
	[Tipo_Moneda] [varchar](15) NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL,
	[Fecha_Venta] [datetime] NOT NULL,
	[Impuesto] [int] NOT NULL,
	[Precio_Compra] [int] NOT NULL,
	[Precio_Venta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_ProductoInnovador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Proveedor] [varchar](45) NOT NULL,
	[Telefono] [int] NOT NULL,
	[correo] [varchar](35) NULL,
	[Tipo_Proveedor] [varchar](45) NOT NULL,
	[Tipos_De_Entrega] [varchar](35) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/2/2023 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [varchar](30) NULL,
	[Telefono] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Caja] ON 

INSERT [dbo].[Caja] ([Id_Caja], [Numero_Maquina], [Ip_Maquina]) VALUES (1, 1, N'192.168.1.0')
INSERT [dbo].[Caja] ([Id_Caja], [Numero_Maquina], [Ip_Maquina]) VALUES (2, 2, N'192.168.1.64')
INSERT [dbo].[Caja] ([Id_Caja], [Numero_Maquina], [Ip_Maquina]) VALUES (3, 3, N'192.168.1.128')
SET IDENTITY_INSERT [dbo].[Caja] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (4, N'Maynor', N'Suazo', N'Masculino', 1246464146, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (16, N'Maynor', N'Suazo', N'Masculino', 1246464146, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (26, N'Maynor', N'Suazo', N'Masculino', 1246464146, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (34, N'Francisco', N'Altamirano', N'Masculino', 1604199400413, 95458854, N'El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (35, N'RIgoberto', N'Arita', N'Masculino', 160415216541, 95458854, N'Barrio Guadalupe Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (36, N'Roberto', N'Machado', N'Masculino', 405654156541, 95458854, N'Barrio Bella Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (37, N'Maynor', N'Suazo', N'Masculino', 1246464146, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (38, N'Cristiano', N'Rodriguez', N'Masculino', 51245414454, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (39, N'Josue', N'Rodriguez', N'Masculino', 160419981145, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (40, N'Alicia', N'Arita', N'Femenina', 16044884544, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (41, N'Francisca', N'Paz', N'Femenina', 15041544665, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (42, N'Estela', N'Arita', N'Femenina', 1504199544584, 95458854, N'Barrio El centro Azacualpa')
INSERT [dbo].[Clientes] ([Id_Clientes], [Nombre_Cliente], [Apellido], [Sexo], [Identidad], [Telefono], [Residencia_Actual]) VALUES (43, N'Carla', N'Altamirano', N'Femenina', 160419954458, 95458854, N'Barrio El centro Azacualpa')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[Clientes_Credito] ([Id_Clientes], [Fecha_Inicio_Credito], [Total_A_Deber], [Cuotas_A_Pagar], [Fecha_Limite_Pagar]) VALUES (4, CAST(N'2023-03-15T00:00:00.000' AS DateTime), 500, 5, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes_Credito] ([Id_Clientes], [Fecha_Inicio_Credito], [Total_A_Deber], [Cuotas_A_Pagar], [Fecha_Limite_Pagar]) VALUES (35, CAST(N'2023-02-26T00:00:00.000' AS DateTime), 350, 7, CAST(N'2023-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes_Credito] ([Id_Clientes], [Fecha_Inicio_Credito], [Total_A_Deber], [Cuotas_A_Pagar], [Fecha_Limite_Pagar]) VALUES (36, CAST(N'2023-05-25T00:00:00.000' AS DateTime), 200, 2, CAST(N'2023-07-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes_Credito] ([Id_Clientes], [Fecha_Inicio_Credito], [Total_A_Deber], [Cuotas_A_Pagar], [Fecha_Limite_Pagar]) VALUES (38, CAST(N'2022-12-05T00:00:00.000' AS DateTime), 800, 5, CAST(N'2023-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes_Credito] ([Id_Clientes], [Fecha_Inicio_Credito], [Total_A_Deber], [Cuotas_A_Pagar], [Fecha_Limite_Pagar]) VALUES (43, CAST(N'2023-01-11T00:00:00.000' AS DateTime), 80, 1, CAST(N'2023-02-11T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CLientes_Factura] ON 

INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (1, 4, 2, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 30, 2, 60)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (2, 34, 1, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 35, 2, 70)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (3, 35, 1, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 35, 3, 105)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (4, 4, 10, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 20, 1, 20)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (5, 36, 7, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 1250, 1, 1250)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (6, 38, 8, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 28, 6, 168)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (7, 39, 10, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 20, 2, 40)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (8, 40, 3, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 5, 3, 15)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (9, 41, 6, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 25, 2, 50)
INSERT [dbo].[CLientes_Factura] ([Id_Factura], [Id_Cliente], [Id_Producto], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (10, 34, 2, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 30, 1, 30)
SET IDENTITY_INSERT [dbo].[CLientes_Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[CLientes_Factura_Innovadora] ON 

INSERT [dbo].[CLientes_Factura_Innovadora] ([Id_Factura_Inno], [Id_Cliente], [Id_ProductoInnovador], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (1, 34, 1, CAST(N'2023-01-14T00:00:00.000' AS DateTime), 150, 2, 300)
INSERT [dbo].[CLientes_Factura_Innovadora] ([Id_Factura_Inno], [Id_Cliente], [Id_ProductoInnovador], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (2, 38, 2, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 150, 2, 300)
INSERT [dbo].[CLientes_Factura_Innovadora] ([Id_Factura_Inno], [Id_Cliente], [Id_ProductoInnovador], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (3, 4, 3, CAST(N'2023-03-10T00:00:00.000' AS DateTime), 150, 2, 300)
INSERT [dbo].[CLientes_Factura_Innovadora] ([Id_Factura_Inno], [Id_Cliente], [Id_ProductoInnovador], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (4, 39, 1, CAST(N'2023-04-13T00:00:00.000' AS DateTime), 150, 1, 150)
INSERT [dbo].[CLientes_Factura_Innovadora] ([Id_Factura_Inno], [Id_Cliente], [Id_ProductoInnovador], [Fecha_Compra], [Precio_Unitario], [Cantidad], [Total_Pagar]) VALUES (5, 41, 4, CAST(N'2023-01-13T00:00:00.000' AS DateTime), 75, 3, 225)
SET IDENTITY_INSERT [dbo].[CLientes_Factura_Innovadora] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalles_Caja] ON 

INSERT [dbo].[Detalles_Caja] ([Id_Detalles], [Fecha_Apertura], [Fecha_Cierre], [Monto_Apertura], [Monto_Cierre], [Id_Caja], [Id_Usuario]) VALUES (1, CAST(N'2023-01-02T08:30:00.000' AS DateTime), CAST(N'2023-01-02T03:00:00.000' AS DateTime), 500, 4000, 1, 1)
INSERT [dbo].[Detalles_Caja] ([Id_Detalles], [Fecha_Apertura], [Fecha_Cierre], [Monto_Apertura], [Monto_Cierre], [Id_Caja], [Id_Usuario]) VALUES (2, CAST(N'2023-01-02T03:00:00.000' AS DateTime), CAST(N'2023-01-02T07:00:00.000' AS DateTime), 4000, 7500, 1, 2)
INSERT [dbo].[Detalles_Caja] ([Id_Detalles], [Fecha_Apertura], [Fecha_Cierre], [Monto_Apertura], [Monto_Cierre], [Id_Caja], [Id_Usuario]) VALUES (3, CAST(N'2023-01-03T08:30:00.000' AS DateTime), CAST(N'2023-01-03T03:00:00.000' AS DateTime), 250, 3500, 2, 3)
INSERT [dbo].[Detalles_Caja] ([Id_Detalles], [Fecha_Apertura], [Fecha_Cierre], [Monto_Apertura], [Monto_Cierre], [Id_Caja], [Id_Usuario]) VALUES (4, CAST(N'2023-01-03T03:00:00.000' AS DateTime), CAST(N'2023-01-03T07:00:00.000' AS DateTime), 3500, 8070, 2, 1)
SET IDENTITY_INSERT [dbo].[Detalles_Caja] OFF
GO
SET IDENTITY_INSERT [dbo].[Gastos_Productos] ON 

INSERT [dbo].[Gastos_Productos] ([Id_GastosProductos], [Productos_Utilizado], [Cantidad], [Fecha_Gasto], [Total_Gasto]) VALUES (1, 10, 3, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 60)
INSERT [dbo].[Gastos_Productos] ([Id_GastosProductos], [Productos_Utilizado], [Cantidad], [Fecha_Gasto], [Total_Gasto]) VALUES (2, 6, 2, CAST(N'2023-02-05T00:00:00.000' AS DateTime), 50)
INSERT [dbo].[Gastos_Productos] ([Id_GastosProductos], [Productos_Utilizado], [Cantidad], [Fecha_Gasto], [Total_Gasto]) VALUES (3, 1, 1, CAST(N'2023-02-14T00:00:00.000' AS DateTime), 35)
INSERT [dbo].[Gastos_Productos] ([Id_GastosProductos], [Productos_Utilizado], [Cantidad], [Fecha_Gasto], [Total_Gasto]) VALUES (4, 3, 4, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Gastos_Productos] ([Id_GastosProductos], [Productos_Utilizado], [Cantidad], [Fecha_Gasto], [Total_Gasto]) VALUES (5, 5, 1, CAST(N'2023-02-14T00:00:00.000' AS DateTime), 20)
SET IDENTITY_INSERT [dbo].[Gastos_Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Otros_Gastos] ON 

INSERT [dbo].[Otros_Gastos] ([Id_OtrosGastos], [Tipo_Gasto], [Descripcion_Gasto], [Fecha_Gasto], [Total_Gasto]) VALUES (1, N'Pago de energia', N'Se paga mensual la energia', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 560)
INSERT [dbo].[Otros_Gastos] ([Id_OtrosGastos], [Tipo_Gasto], [Descripcion_Gasto], [Fecha_Gasto], [Total_Gasto]) VALUES (2, N'Pago de Agua', N'Pago mensual de el Agua', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 140)
INSERT [dbo].[Otros_Gastos] ([Id_OtrosGastos], [Tipo_Gasto], [Descripcion_Gasto], [Fecha_Gasto], [Total_Gasto]) VALUES (3, N'Pago de Impuestos', N'Pago a la Alcaldia', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1400)
INSERT [dbo].[Otros_Gastos] ([Id_OtrosGastos], [Tipo_Gasto], [Descripcion_Gasto], [Fecha_Gasto], [Total_Gasto]) VALUES (4, N'Pago de Telefono', N'A la Agencia Claro', CAST(N'2023-04-02T00:00:00.000' AS DateTime), 750)
SET IDENTITY_INSERT [dbo].[Otros_Gastos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (1, 1, N'Pepsi', N'Pepsi 1 litro', 25, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 15, 28, 35)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (2, 2, N'Coca', N'Coca 1 litro', 24, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-03-05T00:00:00.000' AS DateTime), 15, 26, 30)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (3, 3, N'Anillito', N'1 Ristra', 3, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-04-05T00:00:00.000' AS DateTime), 0, 3, 5)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (4, 1, N'Tozteca', N'Tozteca Picante', 3, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 0, 3, 5)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (5, 1, N'Chetos', N'Hot', 15, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-05-05T00:00:00.000' AS DateTime), 12, 17, 20)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (6, 3, N'Doritos', N'Queso', 18, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-05T00:00:00.000' AS DateTime), 15, 20, 25)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (7, 4, N'Buckana', N'12', 850, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-02-18T00:00:00.000' AS DateTime), 30, 900, 1250)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (8, 5, N'Salva Vida', N'Lata', 20, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-02-12T00:00:00.000' AS DateTime), 12, 23, 28)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (9, 6, N'7 UP', N'1 litro', 24, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-02-12T00:00:00.000' AS DateTime), 15, 26, 28)
INSERT [dbo].[Productos] ([Id_Producto], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (10, 9, N'Arroz', N'1 libra', 10, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-02-14T00:00:00.000' AS DateTime), 30, 15, 20)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos_Almacen] ON 

INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (1, 1, N'Pepsi', 10, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (2, 2, N'coca', 15, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (3, 3, N'Anillito', 70, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (4, 4, N'Tozteca', 20, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (5, 5, N'Chetos', 40, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (6, 6, N'Doritos', 30, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (7, 7, N'Buckana', 8, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (8, 8, N'Salva Vida', 100, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (9, 9, N'7 UP', 50, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos_Almacen] ([Id_Almacen], [Id_Producto], [Nombre_Producto], [Cantidad], [Fecha_Ingresado]) VALUES (10, 10, N'Arroz', 50, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Productos_Almacen] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos_Innovadores] ON 

INSERT [dbo].[Productos_Innovadores] ([Id_ProductoInnovador], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (1, 1, N'Detalles Aniversario', N'chocolates,frutas', 150, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-04-15T00:00:00.000' AS DateTime), 0, 160, 250)
INSERT [dbo].[Productos_Innovadores] ([Id_ProductoInnovador], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (2, 2, N'Detalles A la Madre', N'chocolates,frutas', 150, N'Lps', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-05-10T00:00:00.000' AS DateTime), 0, 160, 250)
INSERT [dbo].[Productos_Innovadores] ([Id_ProductoInnovador], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (3, 2, N'Frutas Internacionales', N'Frescas', 50, N'Lps', CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 15, 65, 75)
INSERT [dbo].[Productos_Innovadores] ([Id_ProductoInnovador], [Id_Proveedor], [Nombre_Producto], [Descripcion_Producto], [Precio_Unitario], [Tipo_Moneda], [Fecha_Compra], [Fecha_Venta], [Impuesto], [Precio_Compra], [Precio_Venta]) VALUES (4, 2, N'Cerveza Internacional', N'Mediana', 75, N'Lps', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 30, 90, 100)
SET IDENTITY_INSERT [dbo].[Productos_Innovadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (1, N'Francisco', 9845785, N'francisco@gmail.com', N'Locales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (2, N'Ivan', 95485474, N'Ivan@gmail.com', N'Internacionales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (3, N'Leonel', 9514248, N'Leonel@gmail.com', N'Globales', N'Tardio')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (4, N'Ian', 96174445, N'Ian@gmail.com', N'Locales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (5, N'Norman', 96174443, N'Norman@gmail.com', N'Locales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (6, N'David', 33112255, N'David@gmail.com', N'Globales', N'A los 15 dias')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (7, N'Roberto', 33225566, N'Roberto@gmail.com', N'Locales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (8, N'Fabricio', 33556985, N'Fabricio@gmail.com', N'Locales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (9, N'Miguel', 35654568, N'Miguel@gmail.com', N'Internacionales', N'Al Instante')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre_Proveedor], [Telefono], [correo], [Tipo_Proveedor], [Tipos_De_Entrega]) VALUES (10, N'Manuel', 32445587, N'Manuel@gmail.com', N'Locales', N'A los 15 dias')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (1, N'Milton', N'Arita', N'El Centro Azacualpa', 96174443)
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (2, N'Melvin', N'Arita', N'El Centro Azacualpa', 96174443)
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (3, N'Leonel', N'Machado', N'El Centro Azacualpa', 95144665)
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (4, N'Katerin', N'Machado', N'El Centro Azacualpa', 94444584)
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (5, N'Cristian', N'Arita', N'El Centro Azacualpa', 33025556)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Clientes_Credito]  WITH CHECK ADD FOREIGN KEY([Id_Clientes])
REFERENCES [dbo].[Clientes] ([Id_Clientes])
GO
ALTER TABLE [dbo].[CLientes_Factura]  WITH CHECK ADD FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Clientes])
GO
ALTER TABLE [dbo].[CLientes_Factura]  WITH CHECK ADD FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[CLientes_Factura_Innovadora]  WITH CHECK ADD FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Clientes])
GO
ALTER TABLE [dbo].[CLientes_Factura_Innovadora]  WITH CHECK ADD FOREIGN KEY([Id_ProductoInnovador])
REFERENCES [dbo].[Productos_Innovadores] ([Id_ProductoInnovador])
GO
ALTER TABLE [dbo].[Detalles_Caja]  WITH CHECK ADD FOREIGN KEY([Id_Caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[Detalles_Caja]  WITH CHECK ADD FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Gastos_Productos]  WITH CHECK ADD FOREIGN KEY([Productos_Utilizado])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Productos_Almacen]  WITH CHECK ADD FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[Productos_Innovadores]  WITH CHECK ADD FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([Id_Proveedor])
GO
USE [master]
GO
ALTER DATABASE [examen] SET  READ_WRITE 
GO
