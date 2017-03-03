use ace
select * from ACEm_MODSFields
select * from ACEm_DGSTemplate where DGSTemplateNm like '%fin%' where DGSTemplateDe like '%cra%' or DGSTemplateDe like '%commercial%'  where DGSTemplateCd='GEN090'

INSERT INTO ACEm_DGSTemplate VALUES ('GEN090','Template_Highly_Leveraged_Transaction','HLT',
			'Approval','Credit Memo/Modification','G','RDP','Package','MC','Lending','NULL',1,1,'SYSTEM',
			GETDATE(),0,0,10,NULL,Null)
			select * from ACEt_SRDocGen  where dgstemplatecd='GEN090'order by 1 desc
			
			delete ACEm_DGSTemplate where DGSTemplateCd='GEN090'
			delete acet_srdocgen where DGSTemplateCd='GEN090'=1084733
			select * from ACEt_SRDocGen where DGSReqID=1085255
	SELECT * FROM ACEt_AppLoanDetail WHERE RDPNr='RDP/N/020217/1ZBM006'
	
	select * from ACEt_LDRegulatoryHlt WHERE LoanDetID=185596	update ACEt_LDRegulatoryHlt set PBDirectDebt=4442 where LoanDetID=185596
	
	select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME like '%HLT%'
	
	select CAST(CAST(123.556 AS INT)AS VARCHAR(50))
SELECT CONVERT( NUMERIC(18,0), ROUND(1245.65879, 0, 1) )

declare @aaa money
set @aaa=244654554.56545
select convert(numeric(11,0),round (124505255,0,0))

ISNULL(CONVERT(VARCHAR(40),OtrIncome1Amt  , 1),' 's

select ISNULL(CONVERT(VARCHAR(40),10.00  , 2),' ')

SUBSTRING(ISNULL(dbo.fn_ConvertMoneyToDecimal(ROUND(10.2523,0)),' '),
 0, LEN(ISNULL(dbo.fn_ConvertMoneyToDecimal(10.2523),' '))-2)  
 select SUBSTRING(ISNULL(CONVERT(VARCHAR(40), 10.0000, 1),' '),
 0, LEN(ISNULL(CONVERT(VARCHAR(40), 10.2500, 1),' '))-4)  
 
 select ROUND(10.2523,0)
 
 ERROR DGSDatabase - FnRetriveXMLInput_DS - System.Data.SqlClient.SqlException
  (0x80131904): Error 537, Level 16, State 2, Procedure ACEsp_DGS_DocGen_HLT, Line 37, 
  Message: Invalid length parameter passed to the LEFT or SUBSTRING function..
       at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
            at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInActio
            
            declare @sss money
            set @sss =null
            select SUBSTRING(CONVERT(VARCHAR(40),ISNULL(@sss,' '), 1),0, 
            LEN(CONVERT(VARCHAR(40), ISNULL(@sss,' '), 1))-2)  
            
            select  LocationTxt ,* from ACEm_ODSEmployee where LocationTxt is not null
            select * from ACEt_AppLoanDetail where RDPNr='RDP/N/122216/1KAM00A'
                      select PortfolioNr,* from ACEt_LoanApplication where RDPNr='RDP/N/122216/1KAM00A'
            
select * from ACEm_ODSPortfolio  where PortfolioNr='VGE'
  select RMUserID,* from ACEt_LoanApplication LA LEFT OUTER JOIN dbo.ACEm_ODSEmployee PortFolio WITH (NOLOCK) 
						ON LA.RMUserID=PortFolio.UserID where RDPNr='RDP/N/122216/1KAM00A'
						select * from ACEm_ODSEmployee where UserID='ACEHC07'
						select MEmp.LocationTxt, LA.PortfolioNr,PortFolio.RptRegionCd,* 	FROM	dbo.ACEt_LoanApplication LA WITH (NOLOCK)	
					INNER JOIN dbo.ACEt_AppLoanDetail ALD WITH (NOLOCK) 
						ON LA.AceAppId=ALD.AceAppID  
					LEFT OUTER JOIN dbo.Acet_Apploandetailsub sub WITH (NOLOCK) 
						ON sub.subloandetid = ALD.subloandetid
					LEFT OUTER JOIN dbo.ACEt_AppCustomer AC    WITH (NOLOCK) 
						ON AC.AceAppId=LA.AceAppID 
						AND AC.AppRoleCd =  'PB' 
						AND AC.ActiveIn =1
					LEFT OUTER JOIN dbo.ACEm_ODSEmployee MEmp  WITH (NOLOCK) 
						ON LA.RMUserId=MEmp.UserId
					LEFT OUTER JOIN dbo.ACEm_ODSPortfolio PortFolio WITH (NOLOCK) 
						ON LA.PortfolioNr=PortFolio.PortfolioNr
			WHERE	
			ALD.LoanDetID=184694