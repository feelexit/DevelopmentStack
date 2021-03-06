/****** Object:  Table [dbo].[AccountType]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountType] ([Id], [Name]) VALUES (1, N'default')
INSERT [dbo].[AccountType] ([Id], [Name]) VALUES (2, N'facebook')
/****** Object:  Table [dbo].[Hilo]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hilo](
	[NextHi] [int] NOT NULL,
	[TableKey] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](25) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[AccountTypeId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[OtherID] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([Id], [Email], [Password], [CreateDate], [Avatar], [AccountTypeId], [FirstName], [LastName], [MiddleName], [OtherID]) VALUES (1, N'feelexit126@hotmail.com', N'password', CAST(0x00009FCE00EFB53C AS DateTime), N'', 2, N'John', N'Qin', N'', N'702711077')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[Stack]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[PostBy] [int] NOT NULL,
	[PostDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Stack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Stack] ON
INSERT [dbo].[Stack] ([Id], [Title], [Description], [PostBy], [PostDate]) VALUES (1, N'test', N'dddddddddddd', 1, CAST(0x00009FCF0100D40C AS DateTime))
SET IDENTITY_INSERT [dbo].[Stack] OFF
/****** Object:  Table [dbo].[Tag]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[Id] [int] NOT NULL,
	[VoteBy] [int] NOT NULL,
	[VoteDate] [datetime] NOT NULL,
	[Score] [tinyint] NOT NULL,
	[StackId] [int] NOT NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StackTag]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StackTag](
	[Id] [int] NOT NULL,
	[StackId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_StackTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 01/05/2012 15:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[Id] [int] NOT NULL,
	[StackId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_User_AccountType]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_AccountType] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountType] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_AccountType]
GO
/****** Object:  ForeignKey [FK_User_User]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
/****** Object:  ForeignKey [FK_Stack_User]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[Stack]  WITH CHECK ADD  CONSTRAINT [FK_Stack_User] FOREIGN KEY([PostBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Stack] CHECK CONSTRAINT [FK_Stack_User]
GO
/****** Object:  ForeignKey [FK_Tag_User]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_User]
GO
/****** Object:  ForeignKey [FK_Vote_Stack]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Stack] FOREIGN KEY([StackId])
REFERENCES [dbo].[Stack] ([Id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Vote_Stack]
GO
/****** Object:  ForeignKey [FK_Vote_User]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_User] FOREIGN KEY([VoteBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Vote_User]
GO
/****** Object:  ForeignKey [FK_StackTag_Stack]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[StackTag]  WITH CHECK ADD  CONSTRAINT [FK_StackTag_Stack] FOREIGN KEY([StackId])
REFERENCES [dbo].[Stack] ([Id])
GO
ALTER TABLE [dbo].[StackTag] CHECK CONSTRAINT [FK_StackTag_Stack]
GO
/****** Object:  ForeignKey [FK_StackTag_Tag]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[StackTag]  WITH CHECK ADD  CONSTRAINT [FK_StackTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[StackTag] CHECK CONSTRAINT [FK_StackTag_Tag]
GO
/****** Object:  ForeignKey [FK_Favorite_Stack]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Stack] FOREIGN KEY([StackId])
REFERENCES [dbo].[Stack] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Stack]
GO
/****** Object:  ForeignKey [FK_Favorite_User]    Script Date: 01/05/2012 15:58:46 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_User]
GO
