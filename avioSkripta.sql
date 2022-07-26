USE [Aviokompanija]
GO
/****** Object:  Table [dbo].[Avioflota]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avioflota](
	[PkAvionID] [int] IDENTITY(1,1) NOT NULL,
	[FkTipID] [int] NOT NULL,
	[SerijskiBroj] [nvarchar](50) NOT NULL,
	[BrojSjedista] [int] NOT NULL,
	[KapacitetRezervoara] [decimal](18, 0) NOT NULL,
	[Nosivost] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Avioflota] PRIMARY KEY CLUSTERED 
(
	[PkAvionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filijale]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filijale](
	[PkFilijalaID] [int] IDENTITY(1,1) NOT NULL,
	[Grad] [nvarchar](max) NOT NULL,
	[Slika] [nvarchar](max) NULL,
 CONSTRAINT [PK_Filijale] PRIMARY KEY CLUSTERED 
(
	[PkFilijalaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jezici]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jezici](
	[PkJezikID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Skracenica] [nvarchar](50) NOT NULL,
	[Obrisan] [bit] NULL,
 CONSTRAINT [PK_Jezici] PRIMARY KEY CLUSTERED 
(
	[PkJezikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JeziciRadnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JeziciRadnika](
	[PkJeziciRadnika] [int] IDENTITY(1,1) NOT NULL,
	[FkJezikID] [int] NOT NULL,
	[FkRadnikID] [int] NOT NULL,
 CONSTRAINT [PK_JeziciRadnika] PRIMARY KEY CLUSTERED 
(
	[PkJeziciRadnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klasa]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klasa](
	[PkKlasaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
	[Cijena] [float] NULL,
	[Obrisan] [bit] NULL,
 CONSTRAINT [PK_Klasa] PRIMARY KEY CLUSTERED 
(
	[PkKlasaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kompanija]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kompanija](
	[PkKompanijaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[E-mail] [nvarchar](50) NOT NULL,
	[PostanskiBroj] [nvarchar](50) NULL,
	[Grad] [nvarchar](50) NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Kompanija] PRIMARY KEY CLUSTERED 
(
	[PkKompanijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[PkKorisnikID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](max) NOT NULL,
	[Prezime] [nvarchar](max) NOT NULL,
	[JMBG] [nvarchar](max) NOT NULL,
	[StrucnaSprema] [int] NULL,
	[FkZanimanjeID] [int] NULL,
	[DatumZaposljavanja] [datetime] NULL,
	[Adresa] [nvarchar](max) NOT NULL,
	[Grad] [nvarchar](max) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Pol] [nvarchar](max) NULL,
	[E-mail] [nvarchar](max) NOT NULL,
	[Lozinka] [nvarchar](max) NOT NULL,
	[BrojPasosa] [nvarchar](50) NULL,
	[KorisnickoIme] [nvarchar](max) NOT NULL,
	[FkUlogaID] [int] NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[PkKorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Letovi]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Letovi](
	[PkLetID] [int] IDENTITY(1,1) NOT NULL,
	[BrojLeta] [nvarchar](50) NOT NULL,
	[FkMjestoPolijetanja] [int] NOT NULL,
	[FkMjestoSlijetanja] [int] NOT NULL,
	[DatumLeta] [datetime] NOT NULL,
	[VrijemePolijetanja] [time](7) NOT NULL,
	[VrijemeSlijetanja] [time](7) NOT NULL,
	[FkAvionID] [int] NOT NULL,
	[FkStutusLetaID] [int] NULL,
	[Cijena] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Letovi] PRIMARY KEY CLUSTERED 
(
	[PkLetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LetoviRadnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetoviRadnika](
	[PkLetoviRadnika] [int] IDENTITY(1,1) NOT NULL,
	[FkLetID] [int] NOT NULL,
	[FkRadnikaID] [int] NOT NULL,
 CONSTRAINT [PK_LetoviRadnika] PRIMARY KEY CLUSTERED 
(
	[PkLetoviRadnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacije]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacije](
	[PkRezervacijeID] [int] IDENTITY(1,1) NOT NULL,
	[FkKorisnikID] [int] NOT NULL,
	[FkLetID] [int] NOT NULL,
	[BrojSjedista] [int] NOT NULL,
	[FkKlasaID] [int] NOT NULL,
	[UkupnaCijena] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Rezervacije] PRIMARY KEY CLUSTERED 
(
	[PkRezervacijeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Šifarnici]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Šifarnici](
	[PkŠifraID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
	[FkRoditeljID] [int] NULL,
	[Alias] [nvarchar](50) NULL,
	[Obrisan] [bit] NULL,
 CONSTRAINT [PK_Šifarnici] PRIMARY KEY CLUSTERED 
(
	[PkŠifraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsputneStanice]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsputneStanice](
	[PkUsputneStaniceId] [int] IDENTITY(1,1) NOT NULL,
	[FkLetID] [int] NOT NULL,
	[FkFilijalaID] [int] NOT NULL,
 CONSTRAINT [PK_UsputneStanice] PRIMARY KEY CLUSTERED 
(
	[PkUsputneStaniceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vijesti]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vijesti](
	[PkVijestiID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](max) NOT NULL,
	[KratkiOpis] [nvarchar](max) NOT NULL,
	[Opis] [nvarchar](max) NOT NULL,
	[Slika] [nvarchar](max) NOT NULL,
	[FkRadnikID] [int] NOT NULL,
 CONSTRAINT [PK_Vijesti_1] PRIMARY KEY CLUSTERED 
(
	[PkVijestiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Avioflota] ON 

INSERT [dbo].[Avioflota] ([PkAvionID], [FkTipID], [SerijskiBroj], [BrojSjedista], [KapacitetRezervoara], [Nosivost]) VALUES (1, 5, N'E195', 122, CAST(227000 AS Decimal(18, 0)), CAST(49 AS Decimal(18, 0)))
INSERT [dbo].[Avioflota] ([PkAvionID], [FkTipID], [SerijskiBroj], [BrojSjedista], [KapacitetRezervoara], [Nosivost]) VALUES (3, 6, N'F100', 107, CAST(227000 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)))
INSERT [dbo].[Avioflota] ([PkAvionID], [FkTipID], [SerijskiBroj], [BrojSjedista], [KapacitetRezervoara], [Nosivost]) VALUES (4, 7, N'777300', 300, CAST(171000 AS Decimal(18, 0)), CAST(238 AS Decimal(18, 0)))
INSERT [dbo].[Avioflota] ([PkAvionID], [FkTipID], [SerijskiBroj], [BrojSjedista], [KapacitetRezervoara], [Nosivost]) VALUES (6, 7, N'757300', 289, CAST(171000 AS Decimal(18, 0)), CAST(124 AS Decimal(18, 0)))
INSERT [dbo].[Avioflota] ([PkAvionID], [FkTipID], [SerijskiBroj], [BrojSjedista], [KapacitetRezervoara], [Nosivost]) VALUES (8, 10, N'A380800', 644, CAST(320000 AS Decimal(18, 0)), CAST(562 AS Decimal(18, 0)))
INSERT [dbo].[Avioflota] ([PkAvionID], [FkTipID], [SerijskiBroj], [BrojSjedista], [KapacitetRezervoara], [Nosivost]) VALUES (10, 7, N'747100', 452, CAST(227000 AS Decimal(18, 0)), CAST(187 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Avioflota] OFF
GO
SET IDENTITY_INSERT [dbo].[Filijale] ON 

INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (1, N'Pariz', N'upload/paris.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (3, N'Budimpešta', N'upload/budimpesta.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (4, N'Amsterdam', N'upload/amsterdam.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (5, N'Abu Dabi', N'upload/abudabi.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (6, N'Brisel', N'upload/brisel.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (8, N'Berlin', N'upload/berlin.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (9, N'Beč', N'upload/bec.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (10, N'Beograd', N'upload/beograd.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (1007, N'Lisabon', N'upload/lisabon.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (1008, N'Frankfurt', N'upload/frankfurt.jpg')
INSERT [dbo].[Filijale] ([PkFilijalaID], [Grad], [Slika]) VALUES (1009, N'Minhen', N'upload/minhen.jpg')
SET IDENTITY_INSERT [dbo].[Filijale] OFF
GO
SET IDENTITY_INSERT [dbo].[Jezici] ON 

INSERT [dbo].[Jezici] ([PkJezikID], [Naziv], [Skracenica], [Obrisan]) VALUES (1, N'Engleski', N'EN', 0)
INSERT [dbo].[Jezici] ([PkJezikID], [Naziv], [Skracenica], [Obrisan]) VALUES (2, N'Njemački', N'DE', 0)
INSERT [dbo].[Jezici] ([PkJezikID], [Naziv], [Skracenica], [Obrisan]) VALUES (4, N'Španski', N'ESP', 0)
INSERT [dbo].[Jezici] ([PkJezikID], [Naziv], [Skracenica], [Obrisan]) VALUES (5, N'Italijanski', N'IT', 0)
INSERT [dbo].[Jezici] ([PkJezikID], [Naziv], [Skracenica], [Obrisan]) VALUES (1006, N'Francuski', N'FRA', 0)
INSERT [dbo].[Jezici] ([PkJezikID], [Naziv], [Skracenica], [Obrisan]) VALUES (1007, N'Danski', N'DEN', 0)
SET IDENTITY_INSERT [dbo].[Jezici] OFF
GO
SET IDENTITY_INSERT [dbo].[JeziciRadnika] ON 

INSERT [dbo].[JeziciRadnika] ([PkJeziciRadnika], [FkJezikID], [FkRadnikID]) VALUES (1, 1, 20)
INSERT [dbo].[JeziciRadnika] ([PkJeziciRadnika], [FkJezikID], [FkRadnikID]) VALUES (8, 2, 20)
INSERT [dbo].[JeziciRadnika] ([PkJeziciRadnika], [FkJezikID], [FkRadnikID]) VALUES (12, 4, 20)
SET IDENTITY_INSERT [dbo].[JeziciRadnika] OFF
GO
SET IDENTITY_INSERT [dbo].[Klasa] ON 

INSERT [dbo].[Klasa] ([PkKlasaID], [Naziv], [Cijena], [Obrisan]) VALUES (1, N'Ekonomska', 1, 0)
INSERT [dbo].[Klasa] ([PkKlasaID], [Naziv], [Cijena], [Obrisan]) VALUES (2, N'Biznis', 10, 0)
INSERT [dbo].[Klasa] ([PkKlasaID], [Naziv], [Cijena], [Obrisan]) VALUES (3, N'Prva', 30, 0)
SET IDENTITY_INSERT [dbo].[Klasa] OFF
GO
SET IDENTITY_INSERT [dbo].[Kompanija] ON 

INSERT [dbo].[Kompanija] ([PkKompanijaID], [Naziv], [Adresa], [Telefon], [E-mail], [PostanskiBroj], [Grad], [Opis]) VALUES (2, N'Beyond the sky', N'Vrbanja 12', N'+387 66 735 254', N'beyondthesky@gmail.com', N'71123', N'Sarajevo', N'<p>Beyond the sky je nova aviokompanija sa glavnim sjedištem u Bosni i
Hercegovini u Sarajevu. Posjeduje filijale širom svijeta:
Beograd,Amsterdam, Pariz, Brisel, Abu Dabi, Beč,Budimpešta,Berlin.
Glavna prednost ove aviokompanije je što posjeduje svoju avioflotu
kojom pruza usluge putnicima i omogućava brzo i sigurno putovanje.
</p><p><br></p><p>
</p><p>Aviokompanija broji više od stotinu radnika širom svijeta. Omogućava
bespolatno registrovanje i rezervisanje letova širom svijeta. Naša
vizija je da budemo najsigurnija, najpouzdanija i najuspješnija
aviokompanije na svijetu za naše kupce i zaposlene.</p>')
SET IDENTITY_INSERT [dbo].[Kompanija] OFF
GO
SET IDENTITY_INSERT [dbo].[Korisnici] ON 

INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (2, N'Dejana', N'Klačar', N'1108997178032', NULL, NULL, NULL, N'Stefana Nemanje 21', N'Istočno Sarajevo', N'066/735-254', N'Ženski', N'dejana@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'74IS', N'admin', 15)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (20, N'Jelena', N'Petrović', N'187645651', 26, 19, CAST(N'2021-03-29T00:00:00.000' AS DateTime), N'Ive Andrica 15', N'Novi Sad', N'056-56265563', N'Ženski', N'jelena@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'78456RE', N'jelena', 16)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (21, N'Marija', N'Marković', N'4864135156', NULL, NULL, NULL, N'Beogradska 12', N'Beograd', N'063/456-656', N'Ženski', N'marija@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'475DST', N'marija', 17)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (1023, N'Petar', N'Petrović', N'11546294946', NULL, NULL, NULL, N'Beogradska 12', N'Beograd', N'065/465-896', N'Muški', N'petar@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'45878RT', N'petar', 17)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (1024, N'Milan', N'Matović', N'48654845', 25, 18, CAST(N'2021-02-01T13:00:00.000' AS DateTime), N'Ive Andrica 21', N'Beograd', N'065/658-895', N'Muški', N'milan@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'546d5s', N'milan', 16)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (1025, N'Nemanja', N'Kostović', N'48746156', 25, 20, CAST(N'2020-03-02T03:00:00.000' AS DateTime), N'Spasovdanska 22', N'Istočno Sarajevo', N'065/565-889', N'Muški', N'nemanja@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'7945DDW', N'nemanja', 16)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (1032, N'Tamara', N'Pantić', N'11987465853', 24, 19, CAST(N'2020-02-05T01:00:00.000' AS DateTime), N'Spasovdanska 12', N'Sarajevo', N'065/789-856', N'Ženski', N'tamara@gmal.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'1234TE4', N'tamara', 16)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (1033, N'Ana', N'Mitrović', N'06059751782659', 26, 21, CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'Bulevar cara Lazara', N'Novi Sad', N'064/8965-451', N'Ženski', N'ana@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'45784RT', N'ana', 16)
INSERT [dbo].[Korisnici] ([PkKorisnikID], [Ime], [Prezime], [JMBG], [StrucnaSprema], [FkZanimanjeID], [DatumZaposljavanja], [Adresa], [Grad], [Telefon], [Pol], [E-mail], [Lozinka], [BrojPasosa], [KorisnickoIme], [FkUlogaID]) VALUES (1034, N'Marko', N'Perić', N'15782956123', 26, 22, CAST(N'2021-01-12T01:00:00.000' AS DateTime), N'Bulevar patrijarha Pavla', N'Novi Sad', N'065/774-559', N'Muški', N'marko@gmail.com', N'⻻왒ꀨ䘐얼쑈Ⱔꖟ쾛鯎敘㫳윌�没', N'12489ET', N'marko', 16)
SET IDENTITY_INSERT [dbo].[Korisnici] OFF
GO
SET IDENTITY_INSERT [dbo].[Letovi] ON 

INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1003, N'1478F', 1, 4, CAST(N'2021-03-17T04:00:00.000' AS DateTime), CAST(N'16:10:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL, CAST(450 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1004, N'784DS', 5, 8, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'19:10:00' AS Time), CAST(N'22:00:00' AS Time), 6, NULL, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1005, N'45W', 9, 6, CAST(N'2021-03-07T01:00:00.000' AS DateTime), CAST(N'02:00:00' AS Time), CAST(N'03:10:00' AS Time), 3, NULL, CAST(450 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1006, N'78E4W', 10, 1, CAST(N'2021-03-17T03:00:00.000' AS DateTime), CAST(N'11:03:00' AS Time), CAST(N'13:10:00' AS Time), 3, NULL, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1007, N'487RT', 8, 5, CAST(N'2021-03-03T02:00:00.000' AS DateTime), CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, 12, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1008, N'12345D', 4, 9, CAST(N'2021-03-03T02:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 4, 12, CAST(120 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1016, N'154ET', 6, 3, CAST(N'2021-03-08T01:00:00.000' AS DateTime), CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 3, NULL, CAST(145 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1017, N'PL123', 1, 1007, CAST(N'2021-03-09T01:00:00.000' AS DateTime), CAST(N'20:00:00' AS Time), CAST(N'22:00:00' AS Time), 4, NULL, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1018, N'BF103', 9, 1008, CAST(N'2021-03-10T01:00:00.000' AS DateTime), CAST(N'20:00:00' AS Time), CAST(N'23:00:00' AS Time), 3, NULL, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Letovi] ([PkLetID], [BrojLeta], [FkMjestoPolijetanja], [FkMjestoSlijetanja], [DatumLeta], [VrijemePolijetanja], [VrijemeSlijetanja], [FkAvionID], [FkStutusLetaID], [Cijena]) VALUES (1019, N'AM145', 4, 1009, CAST(N'2021-03-11T01:00:00.000' AS DateTime), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1, NULL, CAST(600 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Letovi] OFF
GO
SET IDENTITY_INSERT [dbo].[LetoviRadnika] ON 

INSERT [dbo].[LetoviRadnika] ([PkLetoviRadnika], [FkLetID], [FkRadnikaID]) VALUES (1, 1003, 20)
INSERT [dbo].[LetoviRadnika] ([PkLetoviRadnika], [FkLetID], [FkRadnikaID]) VALUES (7, 1003, 1024)
INSERT [dbo].[LetoviRadnika] ([PkLetoviRadnika], [FkLetID], [FkRadnikaID]) VALUES (8, 1003, 1025)
SET IDENTITY_INSERT [dbo].[LetoviRadnika] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervacije] ON 

INSERT [dbo].[Rezervacije] ([PkRezervacijeID], [FkKorisnikID], [FkLetID], [BrojSjedista], [FkKlasaID], [UkupnaCijena]) VALUES (10, 21, 1003, 1, 1, CAST(450 AS Decimal(18, 0)))
INSERT [dbo].[Rezervacije] ([PkRezervacijeID], [FkKorisnikID], [FkLetID], [BrojSjedista], [FkKlasaID], [UkupnaCijena]) VALUES (11, 1023, 1004, 4, 1, CAST(2400 AS Decimal(18, 0)))
INSERT [dbo].[Rezervacije] ([PkRezervacijeID], [FkKorisnikID], [FkLetID], [BrojSjedista], [FkKlasaID], [UkupnaCijena]) VALUES (16, 21, 1008, 1, 1, CAST(120 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Rezervacije] OFF
GO
SET IDENTITY_INSERT [dbo].[Šifarnici] ON 

INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (1, N'Tip aviona', NULL, N'tip_aviona', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (2, N'Status leta', NULL, N'status_leta', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (3, N'Uloge', NULL, N'uloga', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (4, N'Zanimanje', NULL, N'zanimanje', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (5, N'Embraer', 1, N'tip_aviona', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (6, N'Foker', 1, N'tip_aviona', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (7, N'Boeing', 1, N'tip_aviona', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (10, N'Airbus', 1, N'tip_aviona', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (12, N'Sletio', 2, N'status_leta', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (13, N'Otkazan', 2, N'status_leta', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (14, N'Odložen', 2, N'status_leta', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (15, N'Administrator', 3, N'uloga', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (16, N'Radnik', 3, N'uloga', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (17, N'Običan korisnik', 3, N'uloga', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (18, N'Pilot', 4, N'zanimanje', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (19, N'Stujardesa', 4, N'zanimanje', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (20, N'Kopilot', 4, N'zanimanje', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (21, N'Inženjera leta', 4, N'zanimanje', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (22, N'Perser', 4, N'zanimanje', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (23, N'Stručna sprema', NULL, N'strucna_sprema', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (24, N'Srednja stručna sprema', 23, N'strucna_sprema', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (25, N'Viša stručna sprema', 23, N'strucna_sprema', 0)
INSERT [dbo].[Šifarnici] ([PkŠifraID], [Naziv], [FkRoditeljID], [Alias], [Obrisan]) VALUES (26, N'Visoka stručna sprema', 23, N'strucna_sprema', 0)
SET IDENTITY_INSERT [dbo].[Šifarnici] OFF
GO
SET IDENTITY_INSERT [dbo].[UsputneStanice] ON 

INSERT [dbo].[UsputneStanice] ([PkUsputneStaniceId], [FkLetID], [FkFilijalaID]) VALUES (2, 1004, 9)
SET IDENTITY_INSERT [dbo].[UsputneStanice] OFF
GO
SET IDENTITY_INSERT [dbo].[Vijesti] ON 

INSERT [dbo].[Vijesti] ([PkVijestiID], [Naslov], [KratkiOpis], [Opis], [Slika], [FkRadnikID]) VALUES (69, N'Let za London', N'Uspostavljena je nova filijala u Londonu', N'<p><span style="color: rgb(85, 85, 85);">Avikompanije Beyond the sky otvorila je novu filijalu u  Londonu, glavnim gradom Ujedinjenog Kraljevstva. London, inače, kao jedan od najvažnijih svjetskih centara političke moći, kulture, obrazovanja, mode, sporta i turizma, privlači blizu 30 miliona posjetitelja svake godine, što ga čini najposjećenijim gradom u Evropi.</span></p><p><span style="color: rgb(85, 85, 85);">Prvi avion na ovoj ruti – Airbus A380 nove generacije poletio  je iz Sarajevo jutros u 7:00h, te se nakon ceremonije koja je upriličena po slijetanju na londonskom aerodromu Luton vratio u Sarajevo u 14:10h.</span></p><p><span style="color: rgb(85, 85, 85);">Beyon the sky je na ovom promotivnom letu organizovala dolazak oko stotinu predstavnika medija, turističkog sektora i srodnih grana iz Velike Britanije i oni će u Bosni i Hercegovini boraviti idućih nekoliko dana upoznavajući se sa prirodnim ljepotama, sportskim sadržajima, gastronomskim ponudama, te drugim turističkim sadržajima naše zemlje.</span></p><p>Kompanija teži ka ostvarivanju letova iz svih filijala do Londona.</p>', N'upload/news1.jpg', 2)
INSERT [dbo].[Vijesti] ([PkVijestiID], [Naslov], [KratkiOpis], [Opis], [Slika], [FkRadnikID]) VALUES (70, N'Ponova uspostavljanje letova', N'Ponovo će biti uspostavljen letovi za Keln i Stutgart ', N'<p><span style="color: rgb(85, 85, 85);">Od ljetnjeg reda letenja, aviokompanija Beyond the sky je najavila ponovno uspostavljanje linija za Keln i Stuttgart.</span></p><p><span style="color: rgb(85, 85, 85);">Ove linije su posebno ineteresantne za brojnu bh. dijasporu, naše građane koji žive u tom dijelu Njemačke.</span></p><p><span style="color: rgb(85, 85, 85);">Letovi za Keln počinju od 03.04.2021. te bi se u mjesecu april koji bi se odvijali dva puta sedmično, vjerovatno utorkom i petkom.</span></p><p><span style="color: rgb(85, 85, 85);">Od mjeseca juna, kompanija je najavila letove tri puta sedmično za ovu destinaciju, utorkom, četvrtkom i subotom.</span></p><p><span style="color: rgb(85, 85, 85);">Letovi za Stuttgart počinju od 1. juna i odvija će se dva puta sedmično, utorkom i subotom.</span></p><p><span style="color: rgb(85, 85, 85);">Karte se mogu kupiti na Šalteru bile koje filjale kompanije Beyond the ske, kao i online putem zvanične web stranice kompanije.</span></p><p><span style="color: rgb(85, 85, 85);">Više informacija se može dobiti i putem brojeva telefona: 033/289-266 i 033/289-267</span></p><p><span style="color: rgb(85, 85, 85);">Takođe napominjemo da kompanija zbog situacije sa pandemijom Covid-19 zadržavaju pravo izmjene reda letenja.</span></p>', N'upload/news2.jpg', 2)
INSERT [dbo].[Vijesti] ([PkVijestiID], [Naslov], [KratkiOpis], [Opis], [Slika], [FkRadnikID]) VALUES (71, N'Povećan broj putnika preko kompanije', N'20 posto više putnika u odnosu na mjesec august 2019. godine', N'<p><span style="color: rgb(85, 85, 85);">Kroz filijale kompanije Beyond the sky u mjesecu augustu 2020. godine prošlo je 178.943 putnika, što predstavlja rast od preko 20 posto u odnosu na isti mjesec prošle godine. Ovim je nastavljen rapidan rast prometa, a što značajno doprinosi ukupnom razvoju same kompanije.</span></p><p><span style="color: rgb(85, 85, 85);">U prošlom mjesecu realizovano je 3.710 zračnih operacija u svim filijalama, a što je povećanje od 8 posto u odnosu na isti period prošle godine.</span></p><p><span style="color: rgb(85, 85, 85);">S obzirom na ove činjenice, kompanije očekuje da će broj od milion putnika, koji je ostvaren u decembru 2020. godine, biti dostignut već krajem oktobra ili početkom novembra ove godine.</span></p>', N'upload/news3.jpg', 2)
INSERT [dbo].[Vijesti] ([PkVijestiID], [Naslov], [KratkiOpis], [Opis], [Slika], [FkRadnikID]) VALUES (72, N'Prezentiran projekt DANOVA', N'Prezentacija u filijali u Sarajevu', N'<p>DANOVA je transnacionalni projekt saradnje na polju pružanja inovativnih usluga prijevoza za slijepe i slabovidne putnike u Dunavskoj regiji, sufinanciran od strane Dunavskog transnacionalnog programa Interreg, i jedan je od ciljeva programa Europske teritorijalne suradnje koji je financiran od strane Europske Unije.</p><p>Cilj DANOVA projekta jeste poboljšanje pristupačnosti putovanja za slijepe i slabovidne osobe razvijanjem novih usluga i kompetencija kako bi im se omogućio potpun pristup svim uslugama i informacijama o prijevozu. Projekt u trajanju od 30 mjeseci (01.07.2020. – 31.12.2022.) i sa ukupnim proračunom od 2.192.546,66 EUR povezuje partnere iz devet različitih zemalja motivirane da zajedno surađuju kako bi infrastrukturu prijevoza učinile više pristupačnom.</p><p>U Europi živi preko 30 milijuna slijepih i slabovidnih osoba, koje često nisu u mogućnosti putovati samostalno jer više od 96% prijevoznog sustava u Europi, posebno u Dunavskoj regiji, još uvijek nije u potpunosti pristupačno osobama sa oštećenjima vida. U Bosni i Hercegovini je po nekim procjenama oko 5.000 slijepih i slabovidnih osoba.</p><p>Veoma je teško, a u nekim slučajevima čak i nemoguće, putnicima koji su slijepi i slabovidni da koriste uobičajeni prijevoz kao što su zrakoplovi, željeznice ili javni gradski prijevoz. Razlozi za ovo su razni: slijepi i slabovidni putnici nemaju jednak pristup modernim vizualnim ili pisanim informacijama u vezi prijevoza; osoblje često nije obučeno da pomogne i na odgovarajući način komunicira sa slijepim i slabovidnim putnicima; razlike u državnim zakonima o prelasku granica i slično. U cijeloj Dunavskoj regiji, povećava se potreba za organizacijama koje rade i predstavljaju slijepe i slabovidne osobe da uspostave nove usluge kako bi transportna infrastruktura postala više dostupna i uključiva i kako bi se uspostavila puna jednakost slijepih i slabovidnih osoba.</p><p>U okviru DANOVA projekta za slijepe i slabovidne osobe na Međunarodnom aerodromu Sarajevo, neki od prijedloga rješenja koji će biti implementirani su sljedeći:</p><p>1. Mobilna aplikacija za slijepe i slabovidne osobe,</p><p>2. WEB stranica Međunarodnog aerodroma Sarajevo za slijepe i slabovidne osobe,</p><p>3. Interaktivna mapa (fizička mapa koja omoguće interakciju putem dodira ili glasa)</p><p>4. Vodiči/Oznake (piktagrami, ili drugi vizuelni elementi, odgovarajućeg fonta, veličine i kontrasta za slabovidne osobe,</p><p>5. Zvučni vodiči i oznake (zvučni vodiči, elementi koji zvučnim putem usmjeravaju putnike u liftovima, platformama, audio opisi),</p><p>6. Taktilni vodiči/oznake na površinama za kretanje po Međunarodnom aerodromu Sarajevo,</p><p>7. Vodič/oznake/brajlove oznake (Oznake u Brajlovom pismu na toaletima, prostoru za odlazeće putnike i sl.),</p><p>8. AIRA usluge putem kojih agenti usmjeravaju slijepog ili slabovidnog putnika na Međunarodnom aerodromu Sarajevo putem video nadzora ili pametnog telefona,</p><p>9. Osvjetljenje – Unutrašnje ili vanjsko inovativno osvjetljenje (različiti nivoi osvjetljenja, izbjegavanje sjena),</p><p>10. Horizontalno kretanje slijepih i slabovidnih osoba (staze, hodnici, vrata, otpornost na klizavost ručki za vrijeme kretanja</p><p>11. Vertikalno kretanje slijepih i slabovidnih osoba (stepenice, liftovi, rampe, otpornost na klizavost ručki za vrijeme vertikalnog kretanja),</p><p>12. Prodajni objekti (najbolje prakse, inovativna rješenja za kupovinu na aerodromima slijepih i slabovidnih putnika),</p><p>13. Mašine za prodaju (taktilne ili brajlove oznake na tastaturi, displeji sa velikom veličinom slova, opcionim modalitetom boja i audio vodičem,</p><p>14. Catering usluge/ugostiteljski objekti (usluge opsluživanja slijepih i slabovidnih osoba u ugostiteljskim objektima),</p><p>15. Odlazaće i dolazaće točke (platforme, prostor za odlazeće putnike, uvođenje sustava koji omogućuje kretanje slijepih i slabovidnih osoba, dok se nalaze u redu za ukrcavanje),</p><p>16. Prostori za čekanje na let (najbolje prakse, inovativna rješenja, u pogledu prostora za čekanje na let ili registraciju putnika),</p><p>17. Sanitarni objekti (alarm uređaji, prostor za kretanje),</p><p>18. Evakuacijske rute (najbolje prakse, inovativna rješenja u pogledu evakuacijskih putova, uključujući oznake, pronalazak puta)</p><p>19. Objekti za pse vodiče (najbolje prakse, inovativna rješenja za korištenje pasa vodiča)</p><p>20. Uspostavljanje najboljih politika za opslugu slijepih i slabovidnih osoba</p><p>21. Uspostavljanje standarda usluge (najbolje prakse u pogledu nivoa usluge za slijepe i slabovidne osobe</p><p>22. Trening za podizanje svijesti o putnicima sa smanjenom pokretljivosti (Program za podizanje svijesti o slijepim i slabovidnim osobama)</p><p>23. Sve druge usluge koje se mogu ponuditi slijepim i slabovidnim osobama.</p>', N'upload/news4.jpg', 2)
INSERT [dbo].[Vijesti] ([PkVijestiID], [Naslov], [KratkiOpis], [Opis], [Slika], [FkRadnikID]) VALUES (73, N'ACI zdravstveni certifikat', N'Aviokompanije dobila ACI zdravstveni certifikat', N'<p>Kompanije je uspješno okončala aktivnosti na akreditaciji u okviru ACI (Airports Council International) programa akreditacije zdravstvenih usluga na aerodromima. Nakon pregleda dokaza izvedenih kroz postupak procjene, kompanije je pokazala i dokazala da pruža sigurno okruženje za sve putnike, u skladu sa preporučenim zdravstvenim mjerama utvrđenim u ACI smjernicama za ponovno pokretanje i oporavak zrakoplovnog poslovanja, preporukama Vijeća ICAO-a&nbsp;i&nbsp;u skladu sa najboljom industrijskom praksom.</p><p>ACI-jev (Airports Council International) program zdravstvene akreditacije aerodroma (ACI Airport Health Accreditation Programme) omogućuje aerodromskim operatorima da utvrde usklađenost uspostavljenih zdravstvenih mjera na svojim aerodromima sa preporukama ICAO-ove (International Civil Aviation Organization) radne grupe za oporavak zrakoplovstva [Council Aviation Recovery Task Force (CART)].</p><p>U sadržajnom smislu, benefiti od zdravstvene akreditacije sadržane su u mogućnosti aerodromskog operatora da:</p><ul><li>dokaže putnicima, radnicima, regulatoru i državnim organima da je prioritet aerodromskog operatora uspostavljanje sigurnog zdravstvenog okruženja,</li><li>provjeri utvrđene procese i vlastite uspostavljene zdravstvene mjere u prostorima aerodroma,</li><li>putnici steknu povjerenje da je korištenje prostora aerodroma sigurno,</li><li>promovira profesionalnu uspješnost u pogledu održavanja visokog standarda čistoće,</li><li>promovira najbolje prakse u zračnoj industriji, i</li><li>omogućuje harmonizaciju zdravstvenih mjera utvrđenih od strane Međunarodne organizacije civilnog zrakoplovstva - ICAO i njihovu implementaciju na aerodromu.</li></ul><p>Zdravstvena akreditacija obuhvatila je više faza i podrazumijevala je ispunjavanje upitnika i prateće dokumentacije, uz održavanje on line intervjua i provjera sa&nbsp;predstavnicima Vijeća aerodromskih operatora. Po ispunjenju svih zahtjeva na osnovu predočenih dokaza Međunarodnom aerodromu Sarajevo je odobrena certifikacija prema ACI programu zdravstvene akreditacije aerodroma.</p><p>Nakon dobijenog certifikata o akreditaciji, aerodromski operator u redovnim vremenskim intervalima, samostalno provodi nadzor nad primjenom zdravstvenih mjera te na godišnjem nivou obnavlja dobijeni certifikat kroz provođenje postupka recertifikacije i dokazivanja kontinuirane usklađenosti sa zahtjevima programa.</p>', N'upload/news5.jpg', 2)
INSERT [dbo].[Vijesti] ([PkVijestiID], [Naslov], [KratkiOpis], [Opis], [Slika], [FkRadnikID]) VALUES (74, N'Otvaranje novih filijale', N'Aviokompanije otvara još 10 filijala širom svijeta.', N'<p>Aviokompanija sa najvećom stopom rasta, danas je najavila otvaranje novih 10 filijala  i to u gradovima:Atalanta, Peking, Bejing, Los Angeles, Tokio, New York, Chicago,Shangai, Dallas, Rio di janeiro. Najavljeno je i baziranje jednog aviona Airbus A320 u filijali u  Parizu u maju 2021. godine.</p><p>Beyond the sky je aviokompanije  sa investicijskim kreditnim rejtingom i flotom prosječne starosti 5,4 godina koja se sastoji od najefikasnijih i najodrživijih uskotrupnih aviona trenutno dostupnih na tržištu, Airbus A320 i Airbus A320neo. </p><p>Također kompanije je uvela novu eru sanitarnih putovanja sa pojačanim higijenskim mjerama kako bi se osigurali zdravlje i sigurnost putnika i posade. </p>', N'upload/news6.jpg', 2)
SET IDENTITY_INSERT [dbo].[Vijesti] OFF
GO
ALTER TABLE [dbo].[Avioflota]  WITH CHECK ADD  CONSTRAINT [FK_Avioflota_Tip] FOREIGN KEY([FkTipID])
REFERENCES [dbo].[Šifarnici] ([PkŠifraID])
GO
ALTER TABLE [dbo].[Avioflota] CHECK CONSTRAINT [FK_Avioflota_Tip]
GO
ALTER TABLE [dbo].[JeziciRadnika]  WITH CHECK ADD  CONSTRAINT [FK_JeziciRadnika_Jezik] FOREIGN KEY([FkJezikID])
REFERENCES [dbo].[Jezici] ([PkJezikID])
GO
ALTER TABLE [dbo].[JeziciRadnika] CHECK CONSTRAINT [FK_JeziciRadnika_Jezik]
GO
ALTER TABLE [dbo].[JeziciRadnika]  WITH CHECK ADD  CONSTRAINT [FK_JeziciRadnika_Radnik] FOREIGN KEY([FkRadnikID])
REFERENCES [dbo].[Korisnici] ([PkKorisnikID])
GO
ALTER TABLE [dbo].[JeziciRadnika] CHECK CONSTRAINT [FK_JeziciRadnika_Radnik]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Korisnici_StrucnaSprema] FOREIGN KEY([StrucnaSprema])
REFERENCES [dbo].[Šifarnici] ([PkŠifraID])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Korisnici_StrucnaSprema]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Korisnici_Uloga] FOREIGN KEY([FkUlogaID])
REFERENCES [dbo].[Šifarnici] ([PkŠifraID])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Korisnici_Uloga]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Korisnici_Zanimanje] FOREIGN KEY([FkZanimanjeID])
REFERENCES [dbo].[Šifarnici] ([PkŠifraID])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Korisnici_Zanimanje]
GO
ALTER TABLE [dbo].[Letovi]  WITH CHECK ADD  CONSTRAINT [FK_Letovi_Avion] FOREIGN KEY([FkAvionID])
REFERENCES [dbo].[Avioflota] ([PkAvionID])
GO
ALTER TABLE [dbo].[Letovi] CHECK CONSTRAINT [FK_Letovi_Avion]
GO
ALTER TABLE [dbo].[Letovi]  WITH CHECK ADD  CONSTRAINT [FK_Letovi_MjestoPolijetanja] FOREIGN KEY([FkMjestoPolijetanja])
REFERENCES [dbo].[Filijale] ([PkFilijalaID])
GO
ALTER TABLE [dbo].[Letovi] CHECK CONSTRAINT [FK_Letovi_MjestoPolijetanja]
GO
ALTER TABLE [dbo].[Letovi]  WITH CHECK ADD  CONSTRAINT [FK_Letovi_MjestoSlijetanja] FOREIGN KEY([FkMjestoSlijetanja])
REFERENCES [dbo].[Filijale] ([PkFilijalaID])
GO
ALTER TABLE [dbo].[Letovi] CHECK CONSTRAINT [FK_Letovi_MjestoSlijetanja]
GO
ALTER TABLE [dbo].[Letovi]  WITH CHECK ADD  CONSTRAINT [FK_Letovi_Status] FOREIGN KEY([FkStutusLetaID])
REFERENCES [dbo].[Šifarnici] ([PkŠifraID])
GO
ALTER TABLE [dbo].[Letovi] CHECK CONSTRAINT [FK_Letovi_Status]
GO
ALTER TABLE [dbo].[LetoviRadnika]  WITH CHECK ADD  CONSTRAINT [FK_LetoviRadnika_Let] FOREIGN KEY([FkLetID])
REFERENCES [dbo].[Letovi] ([PkLetID])
GO
ALTER TABLE [dbo].[LetoviRadnika] CHECK CONSTRAINT [FK_LetoviRadnika_Let]
GO
ALTER TABLE [dbo].[LetoviRadnika]  WITH CHECK ADD  CONSTRAINT [FK_LetoviRadnika_Radnik] FOREIGN KEY([FkRadnikaID])
REFERENCES [dbo].[Korisnici] ([PkKorisnikID])
GO
ALTER TABLE [dbo].[LetoviRadnika] CHECK CONSTRAINT [FK_LetoviRadnika_Radnik]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Klasa] FOREIGN KEY([FkKlasaID])
REFERENCES [dbo].[Klasa] ([PkKlasaID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Klasa]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Korisnik] FOREIGN KEY([FkKorisnikID])
REFERENCES [dbo].[Korisnici] ([PkKorisnikID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Korisnik]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Let] FOREIGN KEY([FkLetID])
REFERENCES [dbo].[Letovi] ([PkLetID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Let]
GO
ALTER TABLE [dbo].[Šifarnici]  WITH CHECK ADD  CONSTRAINT [FK_Roditelj_Djeca] FOREIGN KEY([FkRoditeljID])
REFERENCES [dbo].[Šifarnici] ([PkŠifraID])
GO
ALTER TABLE [dbo].[Šifarnici] CHECK CONSTRAINT [FK_Roditelj_Djeca]
GO
ALTER TABLE [dbo].[UsputneStanice]  WITH CHECK ADD  CONSTRAINT [FK_UsputneStanice_Filijala] FOREIGN KEY([FkFilijalaID])
REFERENCES [dbo].[Filijale] ([PkFilijalaID])
GO
ALTER TABLE [dbo].[UsputneStanice] CHECK CONSTRAINT [FK_UsputneStanice_Filijala]
GO
ALTER TABLE [dbo].[UsputneStanice]  WITH CHECK ADD  CONSTRAINT [FK_UsputneStanice_Let] FOREIGN KEY([FkLetID])
REFERENCES [dbo].[Letovi] ([PkLetID])
GO
ALTER TABLE [dbo].[UsputneStanice] CHECK CONSTRAINT [FK_UsputneStanice_Let]
GO
ALTER TABLE [dbo].[Vijesti]  WITH CHECK ADD  CONSTRAINT [FK_Vijesti_Radnik] FOREIGN KEY([FkRadnikID])
REFERENCES [dbo].[Korisnici] ([PkKorisnikID])
GO
ALTER TABLE [dbo].[Vijesti] CHECK CONSTRAINT [FK_Vijesti_Radnik]
GO
/****** Object:  StoredProcedure [dbo].[IzistavanjeFilijala]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,18.02.2021>
-- Description:	<Description,Izlistavanje filijala>
-- =============================================
CREATE PROCEDURE [dbo].[IzistavanjeFilijala] 
	-- Add the parameters for the stored procedure here
@Naslov nvarchar(max)=NULL,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT F.PkFilijalaID,F.Grad,F.Slika,UkupanBroj= COUNT(*) OVER() FROM Filijale F
	WHERE F.Grad LIKE '%'+ ISNULL(@Naslov, F.Grad) +'%' 
	order by F.PkFilijalaID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeAvioflote]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,19.02.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeAvioflote] 
@Tip bigint=NULL,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT A.PkAvionID AS 'PkAvionID',A.FkTipID AS 'FkTipID',A.BrojSjedista AS 'BrojSjedista',
	A.KapacitetRezervoara AS 'KapacitetRezervoara',A.Nosivost AS 'Nosivost',A.SerijskiBroj 'SerijskiBroj',S.Naziv AS 'Tip', UkupanBroj= COUNT(*) OVER() 
	FROM Avioflota A,Šifarnici S
	WHERE A.FkTipID=ISNULL(@Tip,A.FkTipID) AND S.PkŠifraID=A.FkTipID
	order by A.PkAvionID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeJezika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klačar>
-- Create date: <Create Date,29.01.2020>
-- Description:	<Description,Izlistavanje jezika>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeJezika]
@Naslov nvarchar(max)=NULL,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT J.PkJezikID,J.Naziv,J.Skracenica, UkupanBroj= COUNT(*) OVER() 
	FROM Jezici J
	WHERE J.Naziv LIKE '%'+ ISNULL(@Naslov, J.Naziv) +'%' AND J.Obrisan=0
	order by J.PkJezikID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeJezikRadnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,18.02.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[IzlistavanjeJezikRadnika]
@ID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT JR.PkJeziciRadnika AS 'PkJeziciRadnika',J.Naziv AS 'Naziv' FROM JeziciRadnika JR, Jezici J WHERE J.PkJezikID=JR.FkJezikID and JR.FkRadnikID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeKlasa]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,18.02.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeKlasa]
@Naziv nvarchar(max)=NULL,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT K.PkKlasaID,K.Naziv,K.Cijena,UkupanBroj= COUNT(*) OVER() FROM Klasa K
	WHERE K.Naziv LIKE '%'+ ISNULL(@Naziv, K.Naziv) +'%' AND K.Obrisan=0
	order by K.PkKlasaID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeKorisnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,16.02.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeKorisnika] 
@Ime nvarchar(max)=NULL,
@PageNumber bigint,
@NumberOfRows bigint,
@Id bigint=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT K.PkKorisnikID as 'PkKorisnikID', K.Ime as 'Ime',K.Prezime as 'Prezime',K.JMBG AS 'JMBG',K.StrucnaSprema AS 'StrucnaSprema',
	K.FkZanimanjeID AS 'FkZanimanjeID',K.DatumZaposljavanja AS 'DatumZaposljavanja',k.BrojPasosa AS 'BrojPasosa',K.KorisnickoIme AS 'KorisnickoIme',
	K.Adresa AS 'Adresa',K.Grad AS 'Grad',K.[E-mail] AS 'E_mail',K.Telefon AS 'Telefon' ,K.Pol AS 'Pol',K.FkUlogaID as 'FkUlogaID', S.Naziv as 'Uloga',UkupanBroj= COUNT(*) OVER() FROM Korisnici K,Šifarnici S
	WHERE K.Ime LIKE '%'+ ISNULL(@Ime, K.Ime) +'%' and s.PkŠifraID=K.FkUlogaID AND K.PkKorisnikID=ISNULL(@Id,K.PkKorisnikID)
	order by K.PkKorisnikID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
	
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeLetova]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,22.02.2021>
-- Description:	<Description,Izlistavanje letova>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeLetova]
	-- Add the parameters for the stored procedure here
@ID bigint=null,
@MjestoPolijetana int=NULL,
@MjestoSlijetanja int=null,
@DatumLeta datetime=null,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT L.PkLetID AS 'PkLetID',L.DatumLeta AS 'DatumLeta',L.FkAvionID AS 'FkAvionID',
	L.FkMjestoPolijetanja AS 'FkMjestoPolijetanja',L.FkMjestoSlijetanja AS 'FkMjestoSlijetanja',L.FkStutusLetaID AS 'FkStutusLetaID',
	L.BrojLeta AS 'BrojLeta',L.VrijemePolijetanja AS 'VrijemePolijetanja',L.VrijemeSlijetanja AS 'VrijemeSlijetanja',L.Cijena AS 'Cijena',
	S.Naziv AS 'StatusLeta',FS.Grad AS 'MjestoSlijetanja',FS.Slika AS 'Slika',FP.Grad AS 'MjestoPolijetanja',UkupanBroj= COUNT(*) OVER() 
	FROM Letovi L LEFT JOIN Šifarnici S ON S.PkŠifraID=L.FkStutusLetaID
	LEFT JOIN Filijale FS ON FS.PkFilijalaID=L.FkMjestoSlijetanja
	LEFT JOIN Filijale FP ON FP.PkFilijalaID=L.FkMjestoPolijetanja 
	WHERE L.FkMjestoPolijetanja=ISNULL(@MjestoPolijetana,L.FkMjestoPolijetanja)
	AND L.FkMjestoSlijetanja=ISNULL(@MjestoSlijetanja,L.FkMjestoSlijetanja)
	and ((@DatumLeta IS NULL) OR (L.DatumLeta>=@DatumLeta AND L.DatumLeta<=DATEADD(DAY,1,@DatumLeta)))
	and L.PkLetID=ISNULL(@ID,L.PkLetID)
    order by L.PkLetID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;

END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeLetovaPojedinacnogRadnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeLetovaPojedinacnogRadnika]
@ID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT L.PkLetID AS 'PkLetID',L.DatumLeta AS 'DatumLeta',
	L.FkMjestoPolijetanja AS 'FkMjestoPolijetanja',L.FkMjestoSlijetanja AS 'FkMjestoSlijetanja',
	L.VrijemePolijetanja AS 'VrijemePolijetanja',L.VrijemeSlijetanja AS 'VrijemeSlijetanja',
	FS.Grad AS 'MjestoSlijetanja',FS.Slika AS 'Slika',FP.Grad AS 'MjestoPolijetanja',UkupanBroj= COUNT(*) OVER() 
	FROM Letovi L LEFT JOIN Filijale FS ON FS.PkFilijalaID=L.FkMjestoSlijetanja
	LEFT JOIN Filijale FP ON FP.PkFilijalaID=L.FkMjestoPolijetanja, Korisnici K,LetoviRadnika LR WHERE LR.FkLetID=L.PkLetID
	AND LR.FkRadnikaID=K.PkKorisnikID AND K.PkKorisnikID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeLetovaRadnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeLetovaRadnika]
@ID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT LR.PkLetoviRadnika AS 'PkLetoviRadnika',K.PkKorisnikID AS 'PkKorisnikID', K.Ime AS 'Ime',K.Prezime AS 'Prezime',S.Naziv AS 'Zanimanje' FROM Korisnici K, LetoviRadnika LR, Šifarnici S 
	WHERE LR.FkLetID=@ID AND LR.FkRadnikaID=K.PkKorisnikID AND K.FkZanimanjeID=S.PkŠifraID
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeRezervacije]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,03.03.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeRezervacije] 
@KorisnikID int=NULL,
@MjestoPolijetana int=NULL,
@MjestoSlijetanja int=null,
@DatumLeta datetime=null,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT R.PkRezervacijeID AS 'PkRezervacijeID',R.FkKorisnikID as 'FkKorisnikID',R.FkLetID as 'FkLetID',R.BrojSjedista as 'BrojSjedista',
	R.FkKlasaID as 'FkKlasaID',R.UkupnaCijena as 'UkupnaCijena',KO.Ime AS 'Ime',KO.Prezime AS 'Prezime',KO.Adresa AS 'Adresa', 
	KO.Telefon AS 'Telefon',K.Naziv AS 'Klasa',L.PkLetID AS 'PkLetID',L.DatumLeta AS 'DatumLeta',L.FkAvionID AS 'FkAvionID',
	L.FkMjestoPolijetanja AS 'FkMjestoPolijetanja',L.FkMjestoSlijetanja AS 'FkMjestoSlijetanja',L.FkStutusLetaID AS 'FkStutusLetaID',
	L.BrojLeta AS 'BrojLeta',L.VrijemePolijetanja AS 'VrijemePolijetanja',L.VrijemeSlijetanja AS 'VrijemeSlijetanja',L.Cijena AS 'Cijena',
	S.Naziv AS 'StatusLeta',FS.Grad AS 'MjestoSlijetanja',FS.Slika AS 'Slika',FP.Grad AS 'MjestoPolijetanja',UkupanBroj= COUNT(*) OVER() 
	FROM Rezervacije R,Korisnici KO, Klasa K,Letovi L LEFT JOIN Šifarnici S ON S.PkŠifraID=L.FkStutusLetaID
	LEFT JOIN Filijale FS ON FS.PkFilijalaID=L.FkMjestoSlijetanja
	LEFT JOIN Filijale FP ON FP.PkFilijalaID=L.FkMjestoPolijetanja 
	WHERE R.FkKlasaID=K.PkKlasaID AND R.FkKorisnikID=KO.PkKorisnikID AND R.FkLetID=L.PkLetID 
	AND KO.PkKorisnikID=ISNULL(@KorisnikID,KO.PkKorisnikID) AND L.FkMjestoPolijetanja=ISNULL(@MjestoPolijetana,L.FkMjestoPolijetanja)
	AND L.FkMjestoSlijetanja=ISNULL(@MjestoSlijetanja,L.FkMjestoSlijetanja)
	and ((@DatumLeta IS NULL) OR (L.DatumLeta>=@DatumLeta and L.DatumLeta<=DATEADD(DAY,1,@DatumLeta)))
	order by R.PkRezervacijeID 
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeSifara]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,18.02.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeSifara]
@Naziv nvarchar(max)=NULL,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT S.PkŠifraID,S.Naziv,S.Alias,UkupanBroj= COUNT(s.PkŠifraID) OVER() FROM Šifarnici S
	WHERE S.Naziv LIKE '%'+ ISNULL(@Naziv, S.Naziv) +'%'  AND S.FkRoditeljID is null AND S.Obrisan=0
	order by S.PkŠifraID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeUsputnihStanica]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,04.03.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeUsputnihStanica]
	-- Add the parameters for the stored procedure here
@ID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.PkUsputneStaniceId AS 'PkUsputneStaniceId',U.FkLetID AS 'FkLetID',U.FkFilijalaID AS 'FkFilijalaID',F.Grad AS 'Grad'
	FROM UsputneStanice U,Letovi L,Filijale F WHERE U.FkLetID=L.PkLetID AND F.PkFilijalaID=U.FkFilijalaID AND L.PkLetID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeVijesti]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,14.02.2021>
-- Description:	<Description,Izlistavnje vijesti>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeVijesti]
@Naslov nvarchar(max)=NULL,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT v.PkVijestiID AS 'PkVijestiID',v.Naslov AS 'Naslov',v.KratkiOpis AS 'KratkiOpis',v.Opis AS 'Opis',v.Slika AS 'Slika',
	v.FkRadnikID AS 'FkRadnikID',K.Ime AS 'Ime',K.Prezime AS 'Prezime', UkupanBroj= COUNT(*) OVER() FROM Vijesti v,Korisnici K
	WHERE v.FkRadnikID=K.PkKorisnikID and  v.Naslov LIKE '%'+ ISNULL(@Naslov, v.Naslov) +'%' 
	order by v.PkVijestiID desc
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavanjeZanimanjaRadnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,01.03.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavanjeZanimanjaRadnika]
@ID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT k.PkKorisnikID,K.Ime,K.Prezime FROM Korisnici K,Šifarnici S WHERE S.PkŠifraID=K.FkZanimanjeID AND S.PkŠifraID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[IzlistavnjeRezervacije]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,03.03.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IzlistavnjeRezervacije] 
@KorisnikID bigint=null,
@MjestoPolijetana int=NULL,
@MjestoSlijetanja int=null,
@DatumLeta datetime=null,
@PageNumber bigint,
@NumberOfRows bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT R.PkRezervacijeID AS 'PkRezervacijeID',R.FkKorisnikID as 'FkKorisnikID',R.FkLetID as 'FkLetID',R.BrojSjedista as 'BrojSjedista',
	R.FkKlasaID as 'FkKlasaID',R.UkupnaCijena as 'UkupnaCijena',KO.Ime AS 'Ime',KO.Prezime AS 'Prezime',KO.Adresa AS 'Adresa', 
	KO.Telefon AS 'Telefon',K.Naziv AS 'Klasa',L.PkLetID AS 'PkLetID',L.DatumLeta AS 'DatumLeta',L.FkAvionID AS 'FkAvionID',
	L.FkMjestoPolijetanja AS 'FkMjestoPolijetanja',L.FkMjestoSlijetanja AS 'FkMjestoSlijetanja',L.FkStutusLetaID AS 'FkStutusLetaID',
	L.BrojLeta AS 'BrojLeta',L.VrijemePolijetanja AS 'VrijemePolijetanja',L.VrijemeSlijetanja AS 'VrijemeSlijetanja',L.Cijena AS 'Cijena',
	S.Naziv AS 'StatusLeta',FS.Grad AS 'MjestoSlijetanja',FS.Slika AS 'Slika',FP.Grad AS 'MjestoPolijetanja', UkupanBroj= COUNT(*) OVER() 
	FROM Rezervacije R,Korisnici KO, Klasa K,Letovi L LEFT JOIN Šifarnici S ON S.PkŠifraID=L.FkStutusLetaID
	LEFT JOIN Filijale FS ON FS.PkFilijalaID=L.FkMjestoSlijetanja
	LEFT JOIN Filijale FP ON FP.PkFilijalaID=L.FkMjestoPolijetanja 
	WHERE R.FkKlasaID=K.PkKlasaID AND R.FkKorisnikID=KO.PkKorisnikID AND R.FkLetID=L.PkLetID AND
	KO.PkKorisnikID=ISNULL(@KorisnikID,KO.PkKorisnikID)
	AND L.FkMjestoPolijetanja=ISNULL(@MjestoPolijetana,L.FkMjestoPolijetanja)
	AND L.FkMjestoSlijetanja=ISNULL(@MjestoSlijetanja,L.FkMjestoSlijetanja)
	and ((@DatumLeta IS NULL) OR (L.DatumLeta>=@DatumLeta and L.DatumLeta<=DATEADD(DAY,1,@DatumLeta)))
	order by R.PkRezervacijeID
	offset (@PageNumber-1)*@NumberOfRows rows
	fetch next @NumberOfRows rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[IzmjenaKorisnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,17.02.2021>
-- Description:	<Description,Izmjena korisnika>
-- =============================================
CREATE PROCEDURE [dbo].[IzmjenaKorisnika]
@Id bigint,
@Ime nvarchar(max),
@Prezime nvarchar(max),
@JMBG nvarchar(max)=null,
@StrucnaSprema int=null,
@FkZanimanjeID int=null,
@DatumZapošljavanja datetime=null,
@Adresa nvarchar(max),
@Grad nvarchar(max),
@Telefon nvarchar(50),
@Pol nvarchar(max)=null,
@E_mail nvarchar(max)=null,
@Lozinka nvarchar(max)=null,
@BrojPasosa nvarchar(50)=null,
@KorisničkoIme nvarchar(50)=null,
@Uloga int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Korisnici]
   SET [Ime] = @Ime
      ,[Prezime] = @Prezime
      ,[JMBG] = @JMBG
      ,[StrucnaSprema] = @StrucnaSprema
      ,[FkZanimanjeID] = @FkZanimanjeID
      ,[DatumZaposljavanja] = @DatumZapošljavanja
      ,[Adresa] = @Adresa
      ,[Grad] = @Grad
      ,[Telefon] = @Telefon
      ,[Pol] = @Pol
      ,[E-mail] = @E_mail
      ,[Lozinka] = HASHBYTES('SHA2_256', @Lozinka)
      ,[BrojPasosa] = @BrojPasosa
      ,[KorisnickoIme] = @KorisničkoIme
      ,[FkUlogaID] = @Uloga
 WHERE PkKorisnikID=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[KreriranjeKorisnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,31.01.2021>
-- Description:	<Description,Kreriranje korisnika>
-- =============================================
CREATE PROCEDURE [dbo].[KreriranjeKorisnika]
@Ime nvarchar(max),
@Prezime nvarchar(max),
@JMBG nvarchar(max)=null,
@StrucnaSprema int=null,
@FkZanimanjeID int=null,
@DatumZapošljavanja datetime=null,
@Adresa nvarchar(max),
@Grad nvarchar(max),
@Telefon nvarchar(50),
@Pol nvarchar(max)=null,
@E_mail nvarchar(max)=null,
@Lozinka nvarchar(max)=null,
@BrojPasosa nvarchar(50)=null,
@KorisničkoIme nvarchar(50)=null,
@Uloga int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [dbo].[Korisnici]
           ([Ime]
           ,[Prezime]
           ,[JMBG]
           ,[StrucnaSprema]
           ,[FkZanimanjeID]
           ,[DatumZaposljavanja]
           ,[Adresa]
           ,[Grad]
           ,[Telefon]
           ,[Pol]
           ,[E-mail]
           ,[Lozinka]
           ,[BrojPasosa]
		   ,[KorisnickoIme]
		   ,[FkUlogaID])
     VALUES
           (@Ime
           ,@Prezime
           ,@JMBG
           ,@StrucnaSprema
           ,@FkZanimanjeID
           ,@DatumZapošljavanja
           ,@Adresa
           ,@Grad
           ,@Telefon
           ,@Pol
           ,@E_mail
           ,HASHBYTES('SHA2_256', @Lozinka)
           ,@BrojPasosa
		   ,@KorisničkoIme,
		   @Uloga)
END
GO
/****** Object:  StoredProcedure [dbo].[ProvjeraKorisnika]    Script Date: 3/9/2021 3:20:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dejana Klacar>
-- Create date: <Create Date,31.01.2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProvjeraKorisnika]
@KorisnickoIme nvarchar(max)=NULL,
@Lozinka nvarchar(max)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT K.PkKorisnikID as 'PkKorisnikID', K.Ime as 'Ime',K.Prezime as 'Prezime',K.JMBG AS 'JMBG',K.StrucnaSprema AS 'StrucnaSprema',
	K.FkZanimanjeID AS 'FkZanimanjeID',K.DatumZaposljavanja AS 'DatumZaposljavanja',k.BrojPasosa AS 'BrojPasosa',K.KorisnickoIme AS 'KorisnickoIme',
	K.Adresa AS 'Adresa',K.Grad AS 'Grad',K.[E-mail] AS 'E_mail',K.Telefon AS 'Telefon' ,K.Pol AS 'Pol',K.FkUlogaID as 'FkUlogaID', S.Naziv as 'Uloga' FROM Korisnici K,Šifarnici S
	WHERE K.KorisnickoIme=@KorisnickoIme AND K.Lozinka=HASHBYTES('SHA2_256', @Lozinka) and s.PkŠifraID=K.FkUlogaID;
END
GO
