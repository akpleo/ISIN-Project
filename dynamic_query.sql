select cd.s2k_id,cd.client_id,cdp.dp_id_number,cd.accountstatus,cdp.client_benfiery_id,
CASE WHEN cdp.poaoprtaccnt='Y' THEN 'Old-POA' 
            WHEN cdp.poaoprtaccnt='P' THEN 'POA' 
            WHEN cdp.poaoprtaccnt='D' THEN 'DDPI'
            WHEN cdp.poaoprtaccnt='DP' THEN 'DDPI+POA'
            WHEN cdp.edis = 'Y' THEN 'EDIS' ELSE 'NO' end CIS_POA_FLAG 
from client_details cd
inner join clientlinkdpacountdetails cdp on  cd.client_detail_id=cdp.client_detail_id
inner join csv_table_data tmp on cd.s2k_id=tmp.s2k_id order by 1 asc;

select cd.s2k_id,cd.client_id,cd.fname,cd.accountstatus,cd.kyc_status,cd.branch_id,d.branch_name,
b.bank_acc_number,c.IFSC,c.bank_branch_name,c.micr_code,b.status,b.isdefaultaccnt 
from client_details cd
join clientbankdetails b on cd.client_detail_id=b.client_detail_id 
join bank_branch_master c on b.bank_branchid=c.bank_branch_id
join branch_master d on cd.branch_id=d.branch_id
join csv_table_data tmp on cd.s2k_id=tmp.s2k_id order by 1 asc;

select cd.s2k_id,cd.client_id,cd.fname,cd.accountstatus,cd.lockremarks,cd.online_offline,cds.CUST_NAME_FH,
concat('"',cds.divnd_acct_numb) as bank_acc_no,concat('"',cds.benf_bank_acno)as bank_acc_no,cds.dp_bank_name,cds.divnd_brnch_numb as IFSC, cds.DVND_BANK_CODE as MICR
from client_details cd 
inner join clientlinkdpacountdetails cdp on cd.client_detail_id=cdp.client_detail_id
inner join CISLIVE.cdsl_dataimport cds on cdp.dp_with_clientid=cds.cid_numb
join csv_table_data tmp on cd.s2k_id=tmp.s2k_id order by 1 asc;
 
select cd.s2k_id,cd.client_id,cd.fname,cd.accountstatus,cd.lockremarks,cd.online_offline,nsd.beneficiary_first_holder_name,
concat('"',nsd.beneficiary_bank_acc_no) as bank_acc_no,nsd.beneficiary_bank_name,nsd.ifsc_code,nsd.micr_code
from client_details cd
inner join clientlinkdpacountdetails cdp on cd.client_detail_id=cdp.client_detail_id
inner join CISLIVE.nsdl_dataimport nsd on To_char(cdp.Client_Benfiery_Id )=To_char(Nsd.Beneficiary_Account_Number) 
join csv_table_data tmp on cd.s2k_id=tmp.s2k_id order by 1 asc;
--11148

select * from clientcommaddrdetails;

select * from CISLIVE.errorlog;

select * from all_source where text like '%insert into errorlog%';

create or replace 
PROCEDURE USP_INSERTUPDATECOUNTRY 
(
 pTYPE                            VARCHAR2,
 pCOUNTRY_ID                      NUMBER,
 pCOUNTRY_NAME                    VARCHAR2,
 pFATCA_COUNTRY_CODE              VARCHAR2,
 pTSS_COUNTRY                     VARCHAR2,
 pSENSITIVITY1                    VARCHAR2,
 pSENSITIVITY2                    VARCHAR2,
 pCURRENCYCODE                    VARCHAR2,
 pCOUNTRYSTATUS                   VARCHAR2,
 pLOGGEDUSER                      NUMBER,
 pMSG                            OUT VARCHAR2
)
AS 

vCOUNT    NUMBER ;
ERROR     ErrorLog%ROWTYPE;

BEGIN
    
    /* Created :kantiprasad On 07 FEB 2018 for getting the data from country and countrymaster_iso */
    /* have used proc on CountryMaster.aspx page */

      pMSG :='';

      IF pTYPE = 'Add'  THEN
      
             Select Count(1) Into Vcount From countrymaster Where country_name = pCOUNTRY_NAME;
             
             if (Vcount = 0) THEN
                      INSERT INTO countrymaster (country_id, country_name , status , create_user , head_id,
                          fatca_country_code,tss_country,sensitivity1,sensitivity2,currencycode,update_date )
                      VALUES (seqCOUNTRY_ID.nextval,pCOUNTRY_NAME,pCOUNTRYSTATUS,pLOGGEDUSER,1,
                          pFATCA_COUNTRY_CODE,pTSS_COUNTRY,pSENSITIVITY1,pSENSITIVITY2,pCURRENCYCODE,SYSDATE());
                      pMSG := 'Country Added Successfull';
             ELSE
                       pMSG := 'Country Already Exist';
             END IF;
               
              
     ELSIF pTYPE = 'Update' THEN
      
              Update countrymaster SET 
                sensitivity1 = pSENSITIVITY1 , 
                sensitivity2 = pSENSITIVITY2 , fatca_country_code = pFATCA_COUNTRY_CODE, 
                update_date =SYSDATE() , CREATE_USER =pLOGGEDUSER
              WHERE COUNTRY_ID =pCOUNTRY_ID;
              pMSG :='Country Updated Successfull'; 
           
      ELSE 
              pMSG :='Invalid Request type';               
     END IF;
     
    
        COMMIT;
        
      
      
 EXCEPTION
 WHEN OTHERS THEN
       pMSG := 'Error';
        ROLLBACK;
        Select seqErrorID.nextval into Error.ERRORID from dual;
        Error.ErrorCode := SQLCODE;
        ERROR.ErrorMsg := SQLERRM;
        Error.ErrorFrom := 'USP_INSERTUPDATECOUNTRY';
        Error.ErrorObjType := 'P';
        insert into errorlog(errorid, userid, errordate, errorcode, errormsg, errorpara, errorfrom, errorobjtype, frmprocess,SEARCH_CONDITION)
        values(error.errorid, 1, sysdate, error.errorcode, error.errormsg, error.errorpara, error.errorfrom, error.errorobjtype, 'USP_GET_KRSCUTINY_INSTA_ACCT',DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Commit;
END USP_INSERTUPDATECOUNTRY; 

create or replace 
PROCEDURE USP_GET_KRSCUTINY_INSTA_ACCT 
(
    pPUSHTO_KR             IN  VARCHAR2,
    pRECORDSET             OUT TYPES.CURSOR_TYPE
)
AS
    Vqry                        VARCHAR2(4000);
    ERROR                       ErrorLog%ROWTYPE;
    
 
BEGIN
/* Created by KALIRAJ : 29-Mar-2016 Getting Data for New customer - INSTA MF Upload  
30-01-2018  kanti added basedonaadhar  ,basedonkra  columns 
06-Nov-2018 => Jayraj :Added Column isaddedit  and passing to Kr
*/
       
     vQry := ' SELECT fe.client_id ,  fe.form_entry_id, Fe.pan_no, fe.pan_name client_name, cbd.bank_branchid ,CASE  WHEN cbd.bank_acc_type = ''SA'' THEN 0 when cbd.bank_acc_type = ''CA'' then 1 END bank_acc_type , ';
     vQry := vQry || '  cbd.bank_acc_number, null micr_code, cbd.IFSC rtgsifsccode, cbd.IFSC neftifsccode ,';
     vQry := vQry || '  CASE WHEN nvl(cbd.isdefaultaccnt,''N'') = ''Y'' THEN 1 else 0 END isdefaultaccnt , cbd.CLI_BANK_DETAILS_ID, ''N'' SUCCESSFLAG,basedonaadhar  ,basedonkra,fe.CHEQUELEAFUPLDFLAG,fe.isaddedit';
     vQry := vQry || '  , CD.city, Cd.state, Cd.pin_code ';
     vQry := vQry || '  FROM formentrydetails fe ';
     vQry := vQry || '  INNER JOIN  client_details CD ON CD.CLIENT_ID=fe.CLIENT_ID ';
     vQry := vQry || '  INNER JOIN clientbankdetails cbd ON cbd.form_entry_id = fe.form_entry_id and cbd.STATUS=''LINK'' ';
     vQry := vQry || '  WHERE fe.instaacct = ''Y'' AND fe.pushto_kr =  ''' ||pPUSHTO_KR || ''' ' ;
    
    
    OPEN pRECORDSET FOR Vqry;
    dbms_output.put_line(Vqry);
 
EXCEPTION
WHEN OTHERS THEN
        ROLLBACK;
        Select seqErrorID.nextval into Error.ERRORID from dual;
        Error.ErrorCode := SQLCODE;
        ERROR.ErrorMsg := SQLERRM;
        Error.ErrorFrom := 'USP_GET_KRSCUTINY_INSTA_ACCT';
        Error.ErrorObjType := 'P';
        insert into errorlog(errorid, userid, errordate, errorcode, errormsg, errorpara, errorfrom, errorobjtype, frmprocess)
        values(error.errorid, 1, sysdate, error.errorcode, error.errormsg, error.errorpara, error.errorfrom, error.errorobjtype, 'USP_GET_KRSCUTINY_INSTA_ACCT');
        Commit;

END USP_GET_KRSCUTINY_INSTA_ACCT; 

CREATE OR REPLACE PROCEDURE fetch_dynamic_data (
    p_table_name     IN VARCHAR2,
    p_column_list    IN VARCHAR2,
    p_filter_column  IN VARCHAR2,
    p_filter_value   IN VARCHAR2,
    p_result_cursor  OUT SYS_REFCURSOR
)
AS
    v_sql       VARCHAR2(4000);
BEGIN
    -- Validate table name
    IF UPPER(p_table_name) NOT IN ('CLIENT_DETAILS', 'CLIENTBANKDETAILS', 'CLIENTLINKDPACOUNTDETAILS', 'CISLIVE.CDSL_DATAIMPORT', 'CISLIVE.NSDL_DATAIMPORT') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid table name');
    END IF;

    -- Validate filter column
    IF UPPER(p_filter_column) NOT IN ('S2K_ID', 'CLIENT_ID', 'PANID', 'DP_ID') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid filter column');
    END IF;

    -- Construct dynamic SQL
    v_sql := 'SELECT ' || p_column_list || 
             ' FROM ' || p_table_name || 
             ' WHERE ' || p_filter_column || ' = :filter_val';

    -- Open cursor for Java to fetch
    OPEN p_result_cursor FOR v_sql USING p_filter_value;

EXCEPTION
    WHEN OTHERS THEN
        DECLARE
            v_error_id NUMBER;
        BEGIN
            SELECT seqErrorID.NEXTVAL INTO v_error_id FROM dual;

            INSERT INTO errorlog (
                errorid,
                userid,
                errordate,
                errorcode,
                errormsg,
                errorpara,
                errorfrom,
                errorobjtype,
                frmprocess,
                search_condition
            ) VALUES (
                v_error_id,
                1,
                SYSDATE,
                SQLCODE,
                SQLERRM,
                'table=' || p_table_name || ', columns=' || p_column_list || ', filter=' || p_filter_column || '=' || p_filter_value,
                'fetch_dynamic_data',
                'P',
                'JavaBulkExport',
                DBMS_UTILITY.FORMAT_ERROR_BACKTRACE
            );
            COMMIT;
        END;
END fetch_dynamic_data;