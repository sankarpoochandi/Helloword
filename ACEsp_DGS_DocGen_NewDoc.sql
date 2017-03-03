USE [ACE]
GO
/****** Object:  StoredProcedure [dbo].[ACEsp_DGS_DocGen_HLT]    Script Date: 01/31/2017 04:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE		[dbo].[ACEsp_DGS_DocGen_HLT]
					(
						@DGSReqID		BIGINT ,
						@OutputElement	VARCHAR(1500)  OUTPUT 
					)
AS
BEGIN
DECLARE  @ACEAppId			BIGINT,
			 @LoanDetId			BIGINT;

BEGIN TRY
		SELECT	@ACEAppId	=	ACEAppID,
				@LoanDetId	=	LoanDetId
		FROM	dbo.ACEt_SRDocGen  WITH (NOLOCK) 
		WHERE	DGSReqID=@DGSReqID

--Genereal Info
		EXECUTE dbo.ACEsp_DGS_CommonInfoForDocGen @ACEAppId,@LoanDetID,'GENERALINFO'

--HLT Details	
	DECLARE @Sectionone BIT,
			@Sectiontwo BIT,
			@SectionThree BIT;
	SELECT 	@Sectionone=CASE WHEN IsExemptFrmLeverage=0 THEN 1 
							ELSE 0
							END,
			@Sectiontwo=CASE WHEN PBDirectDebt>=5000000 AND DebtToTangibleNetWorth>=3 THEN '1' 
							ELSE 0
							END,
			@SectionThree = CASE WHEN SDUnfundedDivEBITDA<=3 THEN 1
							ELSE 0 
						    END
	FROM dbo.ACEt_LDRegulatoryHlt WITH (NOLOCK) 
	WHERE LoanDetID=@LoanDetId
		
		
	SELECT CASE WHEN IsExemptFrmLeverage=1 THEN 'Yes' 
							ELSE 'No'
				END IsExemptFromLeverage
      ,CASE WHEN @Sectionone =1 THEN PBDirectDebt END PBDirDebt
      ,CASE WHEN @Sectionone =1 THEN TotalLiabilities END TotLiabilities
      ,CASE WHEN @Sectionone =1 THEN UnfundedCommitmentsELT END UnfundedCommitELT 
      ,CASE WHEN @Sectionone =1 THEN SubordinatedDebtTL END SubordintDebtTL
      ,CASE WHEN @Sectionone =1 THEN Debt END  Debts
      ,CASE WHEN @Sectionone =1 THEN TangibleNetWorth END  TangiblNetWorth
      ,CASE WHEN @Sectionone =1 THEN RelatedPartyReceivable END  RelatedPartyRecv
      ,CASE WHEN @Sectionone =1 THEN SubordinatedDebtTNW END  SubordinatDebtTNW
      ,CASE WHEN @Sectionone =1 THEN TangibleNetWorthResult END  TangiblNetWorthRes
      ,CASE WHEN @Sectionone =1 THEN DebtToTangibleNetWorth END  DebtToTangiblNetWorth
      ,CASE WHEN @Sectiontwo =1 THEN SeniorDebtAndCommitments END  SeniorDebtAndCommit
      ,CASE WHEN @Sectiontwo =1 THEN UnfundedCommitmentsHLSD END UnfundedCommitHLSD
      ,CASE WHEN @Sectiontwo =1 THEN SeniorDebtAndCommitmentResult END SeniorDebtAndCommitRes
      ,CASE WHEN @Sectiontwo =1 THEN EBITDAHLSD END EBITDAHLSD
      ,CASE WHEN @Sectiontwo =1 THEN SDUnfundedDivEBITDA END SDUnfundedDivEBITDA
      ,CASE WHEN @SectionThree =1 THEN TotalDebt END TotalDebts
      ,CASE WHEN @SectionThree =1 THEN UnfundedCommitmentsHLTD END UnfundedCommitHLTD
      ,CASE WHEN @SectionThree =1 THEN TotalDebtAndCommitments END TotalDebtAndCommits
      ,CASE WHEN @SectionThree =1 THEN EBITDAHLTD END EBITDAHLTD
      ,CASE WHEN @SectionThree =1 THEN TDUnfundedDivEBITDA END TDUnfundedDivEBITDA
      ,ISNULL(ExcessiveLeverage,' ')  ExcesLeverage
      ,ISNULL(HighlyLeveragedTransaction,' ') HighLeveragetran
	  ,ISNULL(PolicyException,' ')  PolicyExcep
	  ,CASE  HasVerifiedHLT WHEN 1 THEN 'Yes' 
							WHEN 0 THEN 'No'
							ELSE ' '
	   END HASVeriByApprover 
	  ,'<Cmt><![CDATA['+ISNULL(replace(hltCmt,char(13)+ char(10),']]></Cmt><Cmt><![CDATA['),' ')+']]></Cmt>' HLTCmts
      ,'<ACmt><![CDATA['+ISNULL(replace(hltApproveCmt,char(13)+ char(10),']]></ACmt><ACmt><![CDATA['),' ')+']]></ACmt>' hltApproveCmts
      
     FROM dbo.ACEt_LDRegulatoryHlt  WITH (NOLOCK)
     WHERE LoanDetID=@LoanDetId
		
END TRY 
BEGIN CATCH
		EXEC dbo.ACEsp_CatchErrorHandler;
END CATCH

END
GO