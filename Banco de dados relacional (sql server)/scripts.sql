USE [VendaProdutoDB]
GO
/****** Object:  Table [dbo].[DimCategoria]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategoria](
	[CategoriaID] [int] NOT NULL,
	[CategoriaNome] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCliente]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCliente](
	[ClienteID] [int] NOT NULL,
	[ClienteNome] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimData]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimData](
	[Data] [date] NOT NULL,
	[Dia] [int] NOT NULL,
	[Mes] [varchar](100) NOT NULL,
	[Ano] [int] NOT NULL,
	[DiaUtil] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFornecedor]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFornecedor](
	[FornecedorID] [int] NOT NULL,
	[FornecedorNome] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FornecedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduto]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduto](
	[ProdutoID] [int] NOT NULL,
	[ProdutoNome] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FatoVendaProduto]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FatoVendaProduto](
	[FatoID] [int] NOT NULL,
	[ProdutoID] [int] NOT NULL,
	[ClienteID] [int] NOT NULL,
	[FornecedorID] [int] NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[QuantidadeVendida] [int] NOT NULL,
	[Preco] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FatoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livros]    Script Date: 01/12/2024 15:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livros](
	[LivroID] [int] NULL,
	[Titulo] [varchar](255) NULL,
	[Autor] [varchar](255) NULL,
	[Genero] [varchar](100) NULL,
	[Editora] [varchar](100) NULL,
	[AnoPublicacao] [int] NULL,
	[StatusEmprestimo] [varchar](20) NULL,
	[EmprestimoID] [int] NULL,
	[DataEmprestimo] [date] NULL,
	[DataDevolucao] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FatoVendaProduto]  WITH CHECK ADD FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[DimCategoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[FatoVendaProduto]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[DimCliente] ([ClienteID])
GO
ALTER TABLE [dbo].[FatoVendaProduto]  WITH CHECK ADD FOREIGN KEY([FornecedorID])
REFERENCES [dbo].[DimFornecedor] ([FornecedorID])
GO
ALTER TABLE [dbo].[FatoVendaProduto]  WITH CHECK ADD FOREIGN KEY([ProdutoID])
REFERENCES [dbo].[DimProduto] ([ProdutoID])
GO
ALTER TABLE [dbo].[FatoVendaProduto]  WITH CHECK ADD FOREIGN KEY([Data])
REFERENCES [dbo].[DimData] ([Data])
GO
