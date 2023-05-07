CREATE TRIGGER R_Basket_insert_update
ON Basket 

AFTER INSERT

AS
BEGIN
    IF EXISTS (
        SELECT ID_SKU
        FROM inserted
        GROUP BY ID_SKU
        HAVING COUNT(*) > 1
    ) 
	BEGIN
    UPDATE Basket
    set DiscountValue = Value*0.05

    END
	ELSE 
	BEGIN
	    UPDATE Basket
       set DiscountValue = 0
	END
END


DROP TRIGGER R_Basket_insert_update;

