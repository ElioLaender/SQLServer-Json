-------------------------------------------------------------------------------
-- Pos parão, quando os valores são nulos, o atributo não é criado no objeto Json. Vale lembar que quando lidamos com NoSql, a estrutura dos dados não precisam
-- ser padronizadas, porém, caso desejemos manter um estrutura, idependente se o valor do atributo é nulo ou não, utilizamos a cláusula INCLUDE_NULL_VALUES 
-- juntamente com a FOR JSON VALUES, por exemplo:
--------------------------------------------------------------------------------
Select x.* From 
(
	Select 'RIO DE JANEIRO' As cidade, 'RJ' As estado, 'BRASIL' As pais
	Union
	Select 'SÃO PAULO' As cidade, 'SP' As estado, 'BRASIL' As pais
	Union
	Select 'NITERÓI' As cidade, 'RJ' As estado, 'BRASIL' As pais
	Union
	Select 'SANTOS' As cidade, 'SP' As estado, 'BRASIL' As pais
	Union
	Select 'MADRID' As cidade, null As estado, 'ESPANHA' As pais
) x
For Json Auto, Include_null_values
----------------------------------------------------------------------------------
-- Json de Retorno
----------------------------------------------------------------------------------
/*
[
    {
       "cidade":"MADRID",
       "estado":null, --> O atributo estado para esse objeto apareceu devido ao uso da cláusula Include_null_values
       "pais":"ESPANHA"
    },
    {
       "cidade":"NITERÓI",
       "estado":"RJ",
       "pais":"BRASIL"
    },
    {
       "cidade":"RIO DE JANEIRO",
       "estado":"RJ",
       "pais":"BRASIL"
    },
    {
       "cidade":"SANTOS",
       "estado":"SP",
       "pais":"BRASIL"
    },
    {
       "cidade":"SÃO PAULO",
       "estado":"SP",
       "pais":"BRASIL"
    }
 ]
*/
----------------------------------------------------------------------------------
-- WITHOUT_ARRAY_WRAPPER: utilizado para que o json seja retornado sem os '[]', porém caso exista mais de um objeto, 
-- o json não será válido, no caso, esse recurso deve ser utilizado quando a consulta retorna apenas um resultado e 
-- se for necessário. 

----------------------------------------------------------------------------------
-- Exemplo de utilização do ROOT('NOME'), responsável por envolver o objeto dentro de um objeto raiz, nomeado no parâmetro
----------------------------------------------------------------------------------
SELECT Geo.* 
from 
(
  SELECT 'RIO DE JANEIRO' AS CIDADE, 'RJ' AS ESTADO,'BRASIL' AS PAIS
) Geo FOR JSON AUTO, ROOT('Geografia');
----------------------------------------------------------------------------------
-- Json de saída
----------------------------------------------------------------------------------
/*
{
   "Geografia":[ --> Criado objeto raiz
      {
         "CIDADE":"RIO DE JANEIRO",
         "ESTADO":"RJ",
         "PAIS":"BRASIL"
      }
   ]
}
*/
----------------------------------------------------------------------------------