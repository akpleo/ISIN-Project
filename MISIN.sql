USE [fnocash]
GO

/****** Object:  Table [dbo].[MISIN]    Script Date: 10/9/2025 10:03:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MISIN](
	[isi_LSrNo] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[isi_lScpSrNo] [int] NOT NULL,
	[isi_tISIN] [varchar](12) NULL,
	[isi_tTradable] [char](1) NULL,
	[isi_tDefFlag] [varchar](1) NULL,
	[isi_tNsdlName] [varchar](30) NULL,
	[isi_tNsdlType] [varchar](30) NULL,
	[isi_lCreDtTime] [datetime] NULL,
	[isi_isSuspendend] [bit] NULL,
 CONSTRAINT [PK_MISIN] PRIMARY KEY CLUSTERED 
(
	[isi_LSrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MISIN] ADD  DEFAULT (getdate()) FOR [isi_lCreDtTime]
GO

ALTER TABLE [dbo].[MISIN] ADD  DEFAULT ((0)) FOR [isi_isSuspendend]
GO


