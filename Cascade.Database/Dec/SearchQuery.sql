--exec [MSI_spAccountSearch] 'boxwell'
DECLARE @originator VARCHAR(51);
DECLARE @accountNumber VARCHAR(20);
DECLARE @seller VARCHAR(255);
DECLARE @ssnFourDigits NVARCHAR(5);

SET @originator = NULL;
SET @accountNumber = NULL;
SET @seller = NULL;
SET @ssnFourDigits = '5012';

	DECLARE @sqlQry VARCHAR(MAX);
	DECLARE @selectClause VARCHAR(1000);
	DECLARE @whereClause VARCHAR(MAX);
	DECLARE @isANDReq bit;
	
	SET @isANDReq = 0;

	SET @selectClause = 'Select * FROM MSI_vwSearch search '
	SET @whereClause = 'Where ';

	IF @originator IS NOT NULL
	BEGIN
		SET @whereClause = @whereClause + ' search.Originator LIKE ''' + @originator + '%'''
		SET @isANDReq = 1
	END
	
	IF @accountNumber IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd

		
		SET @whereClause = @whereClause + ' search.Account = ' + @accountNumber
		SET @isANDReq = 1
	END

	
	IF @seller IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		
		SET @whereClause = @whereClause + ' search.Seller LIKE ''' + @seller + '%'''
		SET @isANDReq = 1
	END
	
	IF @ssnFourDigits IS NOT NULL
	BEGIN
		IF (@isANDReq = 1)
		BEGIN
			SET @whereClause = @whereClause + ' AND '
			SET @isANDReq = 0
		ENd
		SET @whereClause = @whereClause + ' search.SSN LIKE ''' + '%' + @ssnFourDigits + '''';
		SET @isANDReq = 1
	END
	
	SET @sqlQry = @selectClause + @whereClause;

	PRINT @sqlQry;

	EXECUTE(@sqlQry);
	
