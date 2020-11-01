-- Com este exemplo, fica mais claro que o json é gerado respeitando a hierarquea dos joins
-----------------------------------------------------
-- Consulta de Exemplo 
-----------------------------------------------------
SELECT 
	Y.REGIAO, 
	Y.ESTADO, 
	X.CIDADE 
FROM 
(
	SELECT 'RIO DE JANEIRO' AS CIDADE, 'RJ' AS ESTADO
	UNION
	SELECT 'SÃO PAULO' AS CIDADE, 'SP' AS ESTADO
	UNION
	SELECT 'NITERÓI' AS CIDADE, 'RJ' AS ESTADO
	UNION
	SELECT 'SANTOS' AS CIDADE, 'SP' AS ESTADO
) X INNER JOIN 
(
	SELECT 'SP' AS ESTADO, 'SUDESTE' AS REGIAO
	UNION
	SELECT 'RJ' AS ESTADO, 'SUDESTE' AS REGIAO
) Y ON X.ESTADO = Y.ESTADO
For Json Auto
-----------------------------------------------------
-- Json Retornado
-----------------------------------------------------
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
-----------------------------------------------------
-- PS: Quando por ventura a projeção possui valores nulos, em casos de left ou right join, por exemplo, os atributos não são gerados no JSON, veja:
-----------------------------------------------------
/*
[
    {
       "REGIAO":"SUL",
       "ESTADO":"RS",
       "X":[
          {
             "CIDADE":"BAGÉ"
          }
       ]
    },
    {
       "X":[
          {
             "CIDADE":"CURITIBA"
          }
       ]
    },
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
-----------------------------------------------------