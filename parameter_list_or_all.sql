/*************************************************************************************************************
 Author:            Thi Thang Pham
 Description:       stocked procedure to return the value / calculation for a given list of contracts or ALL
					In my example, I'll get the dividend from my dividend table
					
 Parameter(s):      @startdate
					@enddate
					@contract_codes : NULL = all contracts, 
									  OR list of contracts with ; delimeter : '1234;5678;1122'

 *************************************************************************************************************/

 
CREATE OR ALTER PROCEDURE sp_procedure_div
			@startdate DATE = NULL, 
			@enddate DATE = NULL,
			@contract_codes VARCHAR(MAX) = NULL
AS
BEGIN 

-- Create a list of contracts depending on the parameter @contract_codes
IF OBJECT_ID('tempdb..##list_contract_ids') IS NOT NULL
        DROP TABLE ##list_contract_ids
		SELECT contract_id
		INTO ##list_contract_ids
		FROM table_contract
		WHERE (@contract_codes IS NULL OR contract_code IN (SELECT splited_data FROM meta.fn_split_string(@contract_codes, ';'))) 


--Get dividends

IF OBJECT_ID('tempdb..##DIVIDENDS') IS NOT NULL
    DROP TABLE ##DIVIDENDS
BEGIN
	SELECT  d.contract_id
			,product_code
			,type_code
			,d.net_dividend																								
			,d.gross_dividend																							
			,d.payment_date
			,d.dividend_date								
	INTO ##DIVIDENDS																									
	FROM [dbo].[dividend] d
	JOIN ##list_contract_ids lcc
	ON d.contract_id IS NOT NULL AND d.contract_id = lcc.contract_id
	WHERE d.dividend_date BETWEEN @startdate AND @enddate
	
END


END
GO