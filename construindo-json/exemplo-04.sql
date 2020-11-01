-- Com este exemplo, fica mais claro que o json � gerado respeitando a hierarquea dos joins
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
	SELECT 'S�O PAULO' AS CIDADE, 'SP' AS ESTADO
	UNION
	SELECT 'NITER�I' AS CIDADE, 'RJ' AS ESTADO
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
-----------------------------------------------------
-- PS: Quando por ventura a proje��o possui valores nulos, em casos de left ou right join, por exemplo, os atributos n�o s�o gerados no JSON, veja:
-----------------------------------------------------
/*
[
    {
       "REGIAO":"SUL",
       "ESTADO":"RS",
       "X":[
          {
             "CIDADE":"BAG�"
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
-----------------------------------------------------