USE [SpotifyCloneDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15/07/2022 21:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALBUNS]    Script Date: 15/07/2022 21:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALBUNS](
	[Id] [uniqueidentifier] NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
	[Foto] [varchar](250) NULL,
	[BandaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ALBUNS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANDAS]    Script Date: 15/07/2022 21:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANDAS](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Foto] [varchar](250) NULL,
	[Descricao] [varchar](200) NOT NULL,
 CONSTRAINT [PK_BANDAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUSICA_PLAYLIST]    Script Date: 15/07/2022 21:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUSICA_PLAYLIST](
	[PlaylistId] [uniqueidentifier] NOT NULL,
	[MusicaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MUSICA_PLAYLIST] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC,
	[MusicaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUSICAS]    Script Date: 15/07/2022 21:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUSICAS](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[Duracao] [int] NOT NULL,
	[Duracao_Formatada] [varchar](100) NOT NULL,
	[AlbumId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MUSICAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAYLISTS]    Script Date: 15/07/2022 21:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAYLISTS](
	[Id] [uniqueidentifier] NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
	[Foto] [varchar](250) NULL,
	[UsuarioId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PLAYLISTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 15/07/2022 21:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[Email] [varchar](254) NOT NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[Foto] [varchar](200) NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220626003808_Inicial', N'6.0.6')
GO
INSERT [dbo].[ALBUNS] ([Id], [Titulo], [Descricao], [Foto], [BandaId]) VALUES (N'e190530d-667e-42f1-9bb3-c69a117244dd', N'A Dois Passos do Paraíso', N'Ano: 2010', N'http://myurl.com', N'cee1c9d0-84c6-4f45-8408-a756211e1c32')
INSERT [dbo].[ALBUNS] ([Id], [Titulo], [Descricao], [Foto], [BandaId]) VALUES (N'e190530d-667e-42f1-9bb3-c69a117244de', N'Com Você', N'Ano: 1994', N'http://myurl.com', N'cee1c9d0-84c6-4f45-8408-a756211e1c32')
GO
INSERT [dbo].[BANDAS] ([Id], [Nome], [Foto], [Descricao]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa1', N'Biquini Cavadão', N'http://myurl.com', N'Artista verificado')
INSERT [dbo].[BANDAS] ([Id], [Nome], [Foto], [Descricao]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa2', N'Legião Urbana', N'http://myurl.com', N'Artista verificado')
INSERT [dbo].[BANDAS] ([Id], [Nome], [Foto], [Descricao]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa3', N'Nenhum De Nós', N'http://myurl.com', N'Artista verificado')
INSERT [dbo].[BANDAS] ([Id], [Nome], [Foto], [Descricao]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa4', N'Engenheiros do Hawaii', N'http://myurl.com', N'Artista verificado')
INSERT [dbo].[BANDAS] ([Id], [Nome], [Foto], [Descricao]) VALUES (N'cee1c9d0-84c6-4f45-8408-a756211e1c32', N'Blitz', N'http://myurl.com', N'Artista verificado')
GO
INSERT [dbo].[MUSICA_PLAYLIST] ([PlaylistId], [MusicaId]) VALUES (N'c784fad9-9a85-4110-9fa6-1f99b495a684', N'682068cf-c21e-4a36-b843-63b9d181f1bf')
INSERT [dbo].[MUSICA_PLAYLIST] ([PlaylistId], [MusicaId]) VALUES (N'077abae9-c0c6-46f7-986a-b2968d65de98', N'682068cf-c21e-4a36-b843-63b9d181f1bf')
GO
INSERT [dbo].[MUSICAS] ([Id], [Nome], [Duracao], [Duracao_Formatada], [AlbumId]) VALUES (N'682068cf-c21e-4a36-b843-63b9d181f1bf', N'Vento Ventania', 600, N'10 Min : 00 Seg', N'e190530d-667e-42f1-9bb3-c69a117244dd')
INSERT [dbo].[MUSICAS] ([Id], [Nome], [Duracao], [Duracao_Formatada], [AlbumId]) VALUES (N'682068cf-c21e-4a36-b843-63b9d181f1cf', N'Você Não Soube Me Amar', 300, N'05 Min : 00 Seg', N'e190530d-667e-42f1-9bb3-c69a117244de')
GO
INSERT [dbo].[PLAYLISTS] ([Id], [Titulo], [Descricao], [Foto], [UsuarioId]) VALUES (N'c784fad9-9a85-4110-9fa6-1f99b495a684', N'Minha Playlist nº2', N'Preencha sua descrição', N'http://uri.com.br', N'b1fcba9a-819c-4dc0-a542-24f96f8460eb')
INSERT [dbo].[PLAYLISTS] ([Id], [Titulo], [Descricao], [Foto], [UsuarioId]) VALUES (N'b7b1f934-2302-4437-bdb9-86040702b417', N'Minha Playlist nº3', N'Preencha sua descrição', NULL, N'b1fcba9a-819c-4dc0-a542-24f96f8460eb')
INSERT [dbo].[PLAYLISTS] ([Id], [Titulo], [Descricao], [Foto], [UsuarioId]) VALUES (N'077abae9-c0c6-46f7-986a-b2968d65de98', N'Minha Playlist nº1', N'Preencha sua descrição', N'http://uri.com.br', N'b1fcba9a-819c-4dc0-a542-24f96f8460eb')
GO
INSERT [dbo].[USUARIOS] ([Id], [Nome], [Email], [Cpf], [Ativo], [Foto]) VALUES (N'b1fcba9a-819c-4dc0-a542-24f96f8460eb', N'Alexander', N'alex@teste.com', N'19100000000', 1, N'http://url.com')
INSERT [dbo].[USUARIOS] ([Id], [Nome], [Email], [Cpf], [Ativo], [Foto]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66aff1', N'Novo Usuario 1', N'novousuario1@teste.com', N'19100000000', 1, N'http://url.com')
INSERT [dbo].[USUARIOS] ([Id], [Nome], [Email], [Cpf], [Ativo], [Foto]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66aff2', N'Novo Usuario 2', N'novousuario2@teste.com', N'19100000000', 0, N'http://url.com')
INSERT [dbo].[USUARIOS] ([Id], [Nome], [Email], [Cpf], [Ativo], [Foto]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66aff3', N'Novo Usuario 3', N'novousuario3@teste.com', N'19100000000', 1, N'http://url.com')
GO
ALTER TABLE [dbo].[ALBUNS]  WITH CHECK ADD  CONSTRAINT [FK_ALBUNS_BANDAS_BandaId] FOREIGN KEY([BandaId])
REFERENCES [dbo].[BANDAS] ([Id])
GO
ALTER TABLE [dbo].[ALBUNS] CHECK CONSTRAINT [FK_ALBUNS_BANDAS_BandaId]
GO
ALTER TABLE [dbo].[MUSICA_PLAYLIST]  WITH CHECK ADD  CONSTRAINT [FK_MUSICA_PLAYLIST_MUSICAS_MusicaId] FOREIGN KEY([MusicaId])
REFERENCES [dbo].[MUSICAS] ([Id])
GO
ALTER TABLE [dbo].[MUSICA_PLAYLIST] CHECK CONSTRAINT [FK_MUSICA_PLAYLIST_MUSICAS_MusicaId]
GO
ALTER TABLE [dbo].[MUSICA_PLAYLIST]  WITH CHECK ADD  CONSTRAINT [FK_MUSICA_PLAYLIST_PLAYLISTS_PlaylistId] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[PLAYLISTS] ([Id])
GO
ALTER TABLE [dbo].[MUSICA_PLAYLIST] CHECK CONSTRAINT [FK_MUSICA_PLAYLIST_PLAYLISTS_PlaylistId]
GO
ALTER TABLE [dbo].[MUSICAS]  WITH CHECK ADD  CONSTRAINT [FK_MUSICAS_ALBUNS_AlbumId] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[ALBUNS] ([Id])
GO
ALTER TABLE [dbo].[MUSICAS] CHECK CONSTRAINT [FK_MUSICAS_ALBUNS_AlbumId]
GO
ALTER TABLE [dbo].[PLAYLISTS]  WITH CHECK ADD  CONSTRAINT [FK_PLAYLISTS_USUARIOS_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[PLAYLISTS] CHECK CONSTRAINT [FK_PLAYLISTS_USUARIOS_UsuarioId]
GO
