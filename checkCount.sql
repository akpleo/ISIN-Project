Create Procedure checkCount(
@oldIsin varchar(12)='INE485C01011',
@newIsin varchar(12)='INE485C01029'
)
AS
--drop table #CTWIO_tmp

begin 
	
	select * into #CTWIO_tmp from CTWIO with (nolock)  where tio_tISIN in (@oldIsin,@newIsin)

---=====================checking count 

	select count (*) as 'count',tio_tISIN as ISIN from #CTWIO_tmp with (nolock) group by tio_tISIN

---=====================checking quantity 

	select sum(tio_lqty) as qty,tio_tISIN as ISIN from #CTWIO_tmp group by tio_tISIN

end
