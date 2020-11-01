/*
	Utilizar a cláusula For Jason Path, fará com que a geração do json seja desnormalizada, para se adequar ao valor de retorno da consulta. 
*/
------------------------------------------------------------------------------------
-- Exemplo utilizado com For Json Auto apenas
------------------------------------------------------------------------------------
SELECT Y.REGIAO, Y.ESTADO, X.CIDADE
FROM
(SELECT 'RIO DE JANEIRO' AS CIDADE, 'RJ' AS ESTADO
UNION
SELECT 'SÃO PAULO' AS CIDADE, 'SP' AS ESTADO
UNION
SELECT 'NITERÓI' AS CIDADE, 'RJ' AS ESTADO
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
            "CIDADE":"NITERÓI"
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
            "CIDADE":"SÃO PAULO"
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
      "CIDADE":"NITERÓI"
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
      "CIDADE":"SÃO PAULO"
   }
]
*/
------------------------------------------------------------------------------------