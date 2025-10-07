USE [fnocash]
GO

/****** Object:  Table [dbo].[CTWIO]    Script Date: 10/7/2025 10:22:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CTWIO](
	[tio_lSrNo] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[tio_tSettNo] [varchar](13) NULL,
	[tio_lScpSrNo] [int] NULL,
	[tio_tISIN] [varchar](12) NULL,
	[tio_lQty] [int] NULL,
	[tio_lExecDt] [int] NULL,
	[tio_lCltSrNo] [int] NULL,
	[tio_lBefSrNo] [int] NULL,
	[tio_tRemark] [varchar](50) NULL,
	[tio_tDEPO] [varchar](4) NULL,
	[tio_tBoNo] [varchar](16) NULL,
	[tio_tDpId] [varchar](8) NULL,
	[tio_tDpAccNo] [varchar](8) NULL,
	[tio_lBatchDt] [int] NULL,
	[tio_lBatchNo] [int] NULL,
	[tio_lSlipNo] [int] NULL,
	[tio_tIOInd] [char](1) NULL,
	[tio_tNarr] [varchar](250) NULL,
	[tio_tEnterFlag] [char](1) NULL,
	[tio_lEntity] [int] NULL,
	[tio_tTBoNo] [varchar](16) NULL,
	[tio_tTDPId] [varchar](8) NULL,
	[tio_tTDpAccNo] [varchar](8) NULL,
	[tio_tTDepo] [varchar](4) NULL,
	[tio_tADepo] [varchar](4) NULL,
	[tio_tOBsettNo] [varchar](13) NULL,
	[tio_lCreDt] [int] NULL,
	[tio_lUpdDt] [int] NULL,
	[tio_lUsrSrNo] [int] NULL,
	[tio_isResponse] [bit] NULL,
	[tio_lLineNo] [int] NULL,
	[tio_tAuthCode] [varchar](25) NULL,
	[tio_is_eDIS] [bit] NULL,
	[tio_is_Block] [bit] NULL,
	[tio_is_PledgeClosure] [bit] NULL,
	[tio_tCreDateTime] [datetime] NULL,
	[tio_lPledgeOrderNo] [varchar](16) NULL,
	[tio_lisCUSPA] [int] NULL,
	[tio_lCTIOSrNo] [int] NULL,
	[tio_dRate] [float] NULL,
	[tio_lisInvestTiger] [int] NULL,
 CONSTRAINT [PK_CTWIO] PRIMARY KEY CLUSTERED 
(
	[tio_lSrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_isRes__0A5FC696]  DEFAULT ((0)) FOR [tio_isResponse]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_lLine__5E8471B4]  DEFAULT ((0)) FOR [tio_lLineNo]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_tAuth__71CE18CA]  DEFAULT ('') FOR [tio_tAuthCode]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_is_eD__72C23D03]  DEFAULT ((0)) FOR [tio_is_eDIS]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_is_Bl__73B6613C]  DEFAULT ((0)) FOR [tio_is_Block]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_is_Pl__74AA8575]  DEFAULT ((0)) FOR [tio_is_PledgeClosure]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_tCreD__759EA9AE]  DEFAULT (getdate()) FOR [tio_tCreDateTime]
GO

ALTER TABLE [dbo].[CTWIO] ADD  CONSTRAINT [DF__CTWIO__tio_lPled__70C4E5F8]  DEFAULT ('') FOR [tio_lPledgeOrderNo]
GO

ALTER TABLE [dbo].[CTWIO] ADD  DEFAULT ((0)) FOR [tio_lisCUSPA]
GO

ALTER TABLE [dbo].[CTWIO] ADD  DEFAULT ((0)) FOR [tio_lCTIOSrNo]
GO

ALTER TABLE [dbo].[CTWIO] ADD  DEFAULT ((0.00)) FOR [tio_dRate]
GO

ALTER TABLE [dbo].[CTWIO] ADD  DEFAULT ((0)) FOR [tio_lisInvestTiger]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique Serial No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CTWIO', @level2type=N'COLUMN',@level2name=N'tio_lLineNo'
GO


