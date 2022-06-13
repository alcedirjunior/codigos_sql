CREATE VIEW TBBI_VALOR_A_FATURAR_ACUMULADO
AS
-- =============================================
-- Author:	Alcedir Junior
-- Create date: 13/06/2022
-- Description:	View para listar valor a faturar acumulado por mês 
-- =============================================
WITH A
AS
(
	SELECT 
		ANO
		,MES
		,SUM([VALOR A FATURAR]) [VALOR A FATURAR]
	FROM TBBIFAT003
	GROUP BY ANO, MES
)

SELECT
	A.ANO ANO
	,A.MES MES
	,SUM(B.[VALOR A FATURAR]) [VALOR A FATURAR ACUMULADO]
FROM A
INNER JOIN A AS B ON A.ANO = B.ANO AND SUBSTRING(A.MES,1,3) >= SUBSTRING(B.MES,1,3)
GROUP BY A.ANO,A.MES
			