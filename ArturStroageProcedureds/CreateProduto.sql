-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CREATE_PRODUCT
	-- Add the parameters for the stored procedure here
	@ProductNo ProductNo,
	@Name NCHAR(30),
	@PriceUn FLOAT = 0,
	@ProductType NCHAR(9),
	@Weight FLOAT,
	@Gender NCHAR(1),
	@QuantityStock INT, 
	@UnityStock NCHAR(5),
	@Description NVARCHAR(250) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Product(ProductNo, Name, PriceUn, ProductType, Weight, Gender, QuantityStock, UnityStock, Descriprion)
			VALUES (@ProductNo, @Name, @PriceUn, @ProductType, @Weight, @Gender, @QuantityStock, @UnityStock, @Description);
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;

		PRINT 'Surgui um erro ao inserir';
		PRINT ERROR_MESSAGE();
	END CATCH
END
GO
