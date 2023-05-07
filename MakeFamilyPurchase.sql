CREATE PROCEDURE MakeFamilyPurchase(@FamilySurName varchar(255))
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Family WHERE SurName = @FamilySurName)
    BEGIN
        -- если семья не найдена, выводим сообщение об ошибке
        RAISERROR ('Семья с фамилией "%s" не найдена.', 16, 1, @FamilySurName)
        RETURN
    END

    DECLARE @BasketValue money
	set @BasketValue = (

	SELECT sum(Basket.Value)
    FROM Family Join Basket 
    on Basket.ID_Family = Family.id
    WHERE Family.SurName = @FamilySurName)
	

	UPDATE Family 
	set BudgetValue = BudgetValue - @BasketValue
	where SurName = @FamilySurName
    PRINT 'Бюджет для ' + @FamilySurName + ' обновлен'

END

DROP PROCEDURE MakeFamilyPurchase;

EXEC MakeFamilyPurchase 'Edisson'


	/*Процедура при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике
   5.2.1 dbo.Family.BudgetValue - sum(dbo.Basket.Value), где dbo.Basket.Value покупки для переданной в процедуру семьи
   5.2.2 При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет*/



