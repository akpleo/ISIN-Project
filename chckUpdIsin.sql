Create Procedure chckUpdIsin(
@chckCount char = 'N' ,
@editInsin int = 0 ,
@issplit int = 0,
@isbonus int = 0,
@splitRat int = 0,
@oldIsin varchar(12)='',
@newIsin varchar(12)=''
)
AS
begin

if @chckCount = 'Y'

begin
exec checkCount @oldIsin, @newIsin

end

if @editInsin  = 0

begin 

if @issplit = 1

begin 

update CTWIO 
set tio_tISIN=@newIsin,
tio_lQty=FLOOR(tio_lQty * @splitRat)  --- Original Qty * Split Ratio
where tio_tISIN=@oldIsin

end
if @isbonus  = 1

declare 
@scrsrno int
select @scrsrno=scp_lSrNo from CMSCRP(nolock) where scp_tIsin=@newIsin

update CTWIO 
set tio_tISIN=@newIsin,
tio_lScpSrNo=@scrsrno
where tio_tISIN=@oldIsin

end
end