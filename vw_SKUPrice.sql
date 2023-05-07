
use CreateStructure;

CREATE VIEW ProductView AS
SELECT *, dbo.GetSKUPrice(id) AS price
FROM dbo.SKU;


select * from ProductView;


