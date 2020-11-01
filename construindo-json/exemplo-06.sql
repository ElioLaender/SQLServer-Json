/*
	Utilizar a cl�usula For Jason Path, far� com que a gera��o do json seja desnormalizada, para se adequar ao valor de retorno da consulta. 
*/
------------------------------------------------------------------------------------
-- Exemplo utilizado com For Json Auto apenas
------------------------------------------------------------------------------------
SELECT Y.REGIAO, Y.ESTADO, X.CIDADE
FROM
(SELECT 'RIO DE JANEIRO' AS CIDADE, 'RJ' AS ESTADO
UNION
SELECT 'S�O PAULO' AS CIDADE, 'SP' AS ESTADO
UNION
SELECT 'NITER�I' AS CIDADE, 'RJ' AS ESTADO
UNION
SELECT 'SANTOS' AS CIDADE, 'SP' AS ESTADO) X
INNER JOIN 
(SELECT 'SP' AS ESTADO, 'SUDESTE' AS REGIAO
UNION
SELECT 'RJ' AS ESTADO, 'SUDESTE' AS REGIAO) Y
ON X.ESTADO = Y.ESTADO
For Json Path
------------------------------------------------------------------------------------
-- Json Gerado com "For Json Auto"
------------------------------------------------------------------------------------
/*
[
   {
      "REGIAO":"SUDESTE",
      "ESTADO":"RJ",
      "X":[
         {
            "CIDADE":"NITER�I"
         },
         {
            "CIDADE":"RIO DE JANEIRO"
         }
      ]
   },
   {
      "REGIAO":"SUDESTE",
      "ESTADO":"SP",
      "X":[
         {
            "CIDADE":"SANTOS"
         },
         {
            "CIDADE":"S�O PAULO"
         }
      ]
   }
]
*/
------------------------------------------------------------------------------------
-- Json gerado com "For Json Path"
------------------------------------------------------------------------------------
/*
[
   {
      "REGIAO":"SUDESTE",
      "ESTADO":"RJ",
      "CIDADE":"NITER�I"
   },
   {
      "REGIAO":"SUDESTE",
      "ESTADO":"RJ",
      "CIDADE":"RIO DE JANEIRO"
   },
   {
      "REGIAO":"SUDESTE",
      "ESTADO":"SP",
      "CIDADE":"SANTOS"
   },
   {
      "REGIAO":"SUDESTE",
      "ESTADO":"SP",
      "CIDADE":"S�O PAULO"
   }
]
*/
------------------------------------------------------------------------------------