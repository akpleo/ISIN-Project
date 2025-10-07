USE [fnocash]
GO

/****** Object:  Table [dbo].[CMSCRP]    Script Date: 10/7/2025 10:23:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CMSCRP](
	[scp_lSrNo] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[scp_lGnpSrNo] [int] NULL,
	[scp_lCogSrNo] [int] NULL,
	[scp_lIndSrNo] [int] NULL,
	[scp_lSctSrNo] [int] NULL,
	[scp_lRtaSrNo] [int] NULL,
	[scp_tSeries] [varchar](2) NULL,
	[scp_tSymbol] [varchar](20) NULL,
	[scp_tLongNm] [varchar](30) NULL,
	[scp_tShortNm] [varchar](15) NULL,
	[scp_tIsin] [varchar](12) NULL,
	[scp_dCurrRate] [float] NULL,
	[scp_dMarketLot] [float] NULL,
	[scp_dFaceValue] [float] NULL,
	[scp_tRoAddress] [varchar](200) NULL,
	[scp_tRoTelNo] [varchar](20) NULL,
	[scp_tRoCelular] [varchar](12) NULL,
	[scp_tRoFaxNo] [varchar](12) NULL,
	[scp_tRoEmailNo] [varchar](50) NULL,
	[scp_tLoAddress] [varchar](200) NULL,
	[scp_tLoTelNo] [varchar](20) NULL,
	[scp_tLoCelular] [varchar](12) NULL,
	[scp_tLoFaxNo] [varchar](12) NULL,
	[scp_tLoContPer] [varchar](30) NULL,
	[scp_tRoContPer] [varchar](30) NULL,
	[scp_dEps] [float] NULL,
	[scp_tRoPinCd] [varchar](7) NULL,
	[scp_tLoPinCd] [varchar](7) NULL,
	[scp_lRateDt] [int] NULL,
	[scp_tLoEmailNo] [varchar](50) NULL,
	[scp_tCode] [varchar](8) NULL,
	[scp_lCreDt] [int] NULL,
	[scp_lUpdDt] [int] NULL,
	[scp_lUsrSrNo] [int] NULL,
	[scp_lDematDt] [int] NULL,
	[scp_dHairCutEx] [float] NULL,
	[scp_dHairCutClt] [float] NULL,
	[scp_tScpAlpha] [varchar](8) NULL,
	[scp_tNSESetTy] [varchar](50) NULL,
	[scp_tBseSetTy] [varchar](2) NULL,
	[scp_dGrExpoMulti] [float] NULL,
	[scp_tILQInd] [char](1) NULL,
	[scp_dMarginPerc] [float] NULL,
	[scp_dConExpPerc] [float] NULL,
	[scp_dClExpPerc] [float] NULL,
	[Scp_tBondInd] [char](1) NULL,
	[scp_tListed] [varchar](4) NULL,
	[scp_tNsdlName] [varchar](30) NULL,
	[scp_tTradable] [char](1) NULL,
	[scp_lNSEIssueCap] [float] NULL,
	[scp_lBSEIssueCap] [float] NULL,
	[scp_tNSESK_Scp_Code] [varchar](25) NULL,
	[scp_tBSESK_Scp_Code] [varchar](25) NULL,
	[scp_tNSEAprInd] [char](1) NULL,
	[scp_tBSEAprInd] [char](1) NULL,
	[scp_tFNOAprInd] [char](1) NULL,
	[scp_dBseVar] [float] NULL,
	[scp_tRiskCateg] [char](1) NULL,
	[scp_bIsEof] [bit] NULL,
	[scp_lSectorSrNo] [int] NULL,
	[scp_tTradeISIN] [varchar](12) NULL,
	[isBond] [bit] NULL,
	[scp_iExclusive] [bit] NULL,
	[EMF_SharekhanHairCut] [numeric](5, 2) NULL,
	[ELMPercentage] [numeric](5, 2) NULL,
	[isOwnApproved] [bit] NULL,
	[MarginRequired_Perc] [numeric](5, 2) NULL,
	[Margin_Call_Perc1] [numeric](5, 2) NULL,
	[Margin_Call_Perc2] [numeric](5, 2) NULL,
	[Margin_Call_Perc3] [numeric](5, 2) NULL,
	[SquareOff_Call_Perc] [numeric](5, 2) NULL,
	[isFundingApproved] [bit] NULL,
	[isPhysicalSettledScrip] [bit] NULL,
	[Scp_tNSCCLNSESymbol] [varchar](50) NULL,
	[Scp_tNSCCLBSESymbol] [varchar](50) NULL,
	[Scp_tNSCCLMSEISymbol] [varchar](50) NULL,
	[Scp_tNSCCLSymbol] [varchar](50) NULL,
	[Scp_tNSCCLDesc] [varchar](100) NULL,
	[scp_lsecSrno] [int] NULL,
	[scp_isStockCashInd] [bit] NULL,
	[IsT1Settlement] [bit] NULL,
	[scp_tInstrumentType] [varchar](10) NULL,
	[scp_isRepledgeApprove] [bit] NULL,
	[scp_tRePledgeSymbol] [varchar](50) NULL,
	[scp_tComAprInd] [varchar](5) NULL,
	[scp_isStockCashIndComm] [bit] NULL,
	[scp_tCodeT0] [varchar](10) NULL,
	[scp_IsT0Settlement] [bit] NULL,
	[scp_tSeriesT0] [varchar](10) NULL,
	[scp_tNSESK_Scp_CodeT0] [varchar](25) NULL,
	[scp_tBSESK_Scp_CodeT0] [varchar](25) NULL,
	[scp_tUOM] [varchar](10) NULL,
	[scp_isGroup1] [bit] NULL,
	[scp_dMktCap] [numeric](18, 2) NULL,
	[scp_dPrcBand] [numeric](5, 2) NULL,
	[scp_dVar] [numeric](5, 2) NULL,
 CONSTRAINT [PK_CMSCRP] PRIMARY KEY CLUSTERED 
(
	[scp_lSrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_dHairCutClt]  DEFAULT ((100)) FOR [scp_dHairCutClt]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_dGrExpoMulti]  DEFAULT (8.5) FOR [scp_dGrExpoMulti]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_tILQInd]  DEFAULT ('L') FOR [scp_tILQInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF__CMSCRP__scp_dMar__1B29CEB6]  DEFAULT (0) FOR [scp_dMarginPerc]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF__CMSCRP__scp_dCon__1C1DF2EF]  DEFAULT (0) FOR [scp_dConExpPerc]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF__CMSCRP__scp_dClE__1D121728]  DEFAULT (0) FOR [scp_dClExpPerc]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_Scp_tBondInd]  DEFAULT ('N') FOR [Scp_tBondInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF__CMSCRP__scp_tLis__293ABC84]  DEFAULT ('') FOR [scp_tListed]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF__CMSCRP__scp_tNsd__2A2EE0BD]  DEFAULT ('') FOR [scp_tNsdlName]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF__CMSCRP__scp_tTra__2B2304F6]  DEFAULT ('') FOR [scp_tTradable]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT (0) FOR [scp_lNSEIssueCap]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT (0) FOR [scp_lBSEIssueCap]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tNSESK_Scp_Code]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_tBSESK_Scp_Code]  DEFAULT ('') FOR [scp_tBSESK_Scp_Code]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('N') FOR [scp_tNSEAprInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('N') FOR [scp_tBSEAprInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('N') FOR [scp_tFNOAprInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_dBseVar]  DEFAULT (0) FOR [scp_dBseVar]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_tRiskCateg]  DEFAULT ('C') FOR [scp_tRiskCateg]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_bIsEof]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_lSectorSrNo]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tTradeISIN]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [isBond]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  CONSTRAINT [DF_CMSCRP_scp_iExclusive]  DEFAULT ((0)) FOR [scp_iExclusive]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [EMF_SharekhanHairCut]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [ELMPercentage]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [isOwnApproved]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [MarginRequired_Perc]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [Margin_Call_Perc1]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [Margin_Call_Perc2]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [Margin_Call_Perc3]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [SquareOff_Call_Perc]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [isFundingApproved]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [isPhysicalSettledScrip]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [Scp_tNSCCLNSESymbol]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [Scp_tNSCCLBSESymbol]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [Scp_tNSCCLMSEISymbol]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [Scp_tNSCCLSymbol]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [Scp_tNSCCLDesc]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_lsecSrno]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_isStockCashInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [IsT1Settlement]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_isRepledgeApprove]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('N') FOR [scp_tComAprInd]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tCodeT0]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_IsT0Settlement]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tSeriesT0]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tNSESK_Scp_CodeT0]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tBSESK_Scp_CodeT0]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ('') FOR [scp_tUOM]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_isGroup1]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_dMktCap]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_dPrcBand]
GO

ALTER TABLE [dbo].[CMSCRP] ADD  DEFAULT ((0)) FOR [scp_dVar]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trade isin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CMSCRP', @level2type=N'COLUMN',@level2name=N'scp_tTradeISIN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'bond scrip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CMSCRP', @level2type=N'COLUMN',@level2name=N'isBond'
GO


