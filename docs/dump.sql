USE [de41_sokolova_v1_edu]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 21.05.2024 15:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[surname] [nchar](70) NOT NULL,
	[patronimyc] [nchar](90) NULL,
	[login] [nchar](50) NOT NULL,
	[password] [nchar](150) NOT NULL,
	[phone] [nchar](11) NULL,
	[email] [nchar](100) NULL,
	[age] [int] NULL,
	[role] [nchar](20) NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_has_shift]    Script Date: 21.05.2024 15:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_has_shift](
	[id] [int] NOT NULL,
	[id_employee] [int] NULL,
	[id_shift] [int] NULL,
 CONSTRAINT [PK_employee_has_shift] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 21.05.2024 15:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] NOT NULL,
	[timeStart] [time](7) NOT NULL,
	[timeEnd] [time](7) NULL,
	[numTable] [int] NOT NULL,
	[status] [nchar](20) NULL,
	[id_employee] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_has_product]    Script Date: 21.05.2024 15:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_has_product](
	[id] [int] NOT NULL,
	[id_order] [int] NULL,
	[id_product] [int] NULL,
 CONSTRAINT [PK_order_has_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 21.05.2024 15:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] NOT NULL,
	[name] [nchar](100) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[decription] [nchar](300) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shift]    Script Date: 21.05.2024 15:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shift](
	[id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[timeStart] [time](7) NOT NULL,
	[timeEnd] [time](7) NOT NULL,
 CONSTRAINT [PK_shift] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [name], [surname], [patronimyc], [login], [password], [phone], [email], [age], [role]) VALUES (0, N'Анастасия                                         ', N'Костенкова                                                            ', N'Иванован                                                                                  ', N'1                                                 ', N'1                                                                                                                                                     ', N'1          ', N'1                                                                                                   ', 1, N'Повар               ')
INSERT [dbo].[employee] ([id], [name], [surname], [patronimyc], [login], [password], [phone], [email], [age], [role]) VALUES (1, N'Ольга                                             ', N'Соколова                                                              ', N'Евгеньевна                                                                                ', N'2                                                 ', N'2                                                                                                                                                     ', N'2          ', N'2                                                                                                   ', 2, N'Администратор       ')
INSERT [dbo].[employee] ([id], [name], [surname], [patronimyc], [login], [password], [phone], [email], [age], [role]) VALUES (2, N'Денис                                             ', N'Ищук                                                                  ', N'Николаевич                                                                                ', N'3                                                 ', N'3                                                                                                                                                     ', N'3          ', N'3                                                                                                   ', 3, N'Официант            ')
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
INSERT [dbo].[product] ([id], [name], [price], [decription]) VALUES (1, N'овсянка                                                                                             ', CAST(125.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[product] ([id], [name], [price], [decription]) VALUES (2, N'манка                                                                                               ', CAST(160.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[product] ([id], [name], [price], [decription]) VALUES (3, N'цезарь                                                                                              ', CAST(300.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[product] ([id], [name], [price], [decription]) VALUES (4, N'борщ                                                                                                ', CAST(400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[product] ([id], [name], [price], [decription]) VALUES (5, N'солянка                                                                                             ', CAST(399.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[product] ([id], [name], [price], [decription]) VALUES (6, N'гороховый                                                                                           ', CAST(250.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[shift] ([id], [date], [timeStart], [timeEnd]) VALUES (1, CAST(N'2024-05-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[shift] ([id], [date], [timeStart], [timeEnd]) VALUES (2, CAST(N'2024-05-20' AS Date), CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
ALTER TABLE [dbo].[employee_has_shift]  WITH CHECK ADD  CONSTRAINT [FK_employee_has_shift_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[employee_has_shift] CHECK CONSTRAINT [FK_employee_has_shift_employee]
GO
ALTER TABLE [dbo].[employee_has_shift]  WITH CHECK ADD  CONSTRAINT [FK_employee_has_shift_shift] FOREIGN KEY([id_shift])
REFERENCES [dbo].[shift] ([id])
GO
ALTER TABLE [dbo].[employee_has_shift] CHECK CONSTRAINT [FK_employee_has_shift_shift]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_employee]
GO
ALTER TABLE [dbo].[order_has_product]  WITH CHECK ADD  CONSTRAINT [FK_order_has_product_order] FOREIGN KEY([id_order])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_has_product] CHECK CONSTRAINT [FK_order_has_product_order]
GO
ALTER TABLE [dbo].[order_has_product]  WITH CHECK ADD  CONSTRAINT [FK_order_has_product_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_has_product] CHECK CONSTRAINT [FK_order_has_product_product]
GO
