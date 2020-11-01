-------------------------------------------------------------------------------
-- Pos par�o, quando os valores s�o nulos, o atributo n�o � criado no objeto Json. Vale lembar que quando lidamos com NoSql, a estrutura dos dados n�o precisam
-- ser padronizadas, por�m, caso desejemos manter um estrutura, idependente se o valor do atributo � nulo ou n�o, utilizamos a cl�usula INCLUDE_NULL_VALUES 
-- juntamente com a FOR JSON VALUES, por exemplo:
--------------------------------------------------------------------------------
Select x.* From 
(
	Select 'RIO DE JANEIRO' As cidade, 'RJ' As estado, 'BRASIL' As pais
	Union
	Select 'S�O PAULO' As cidade, 'SP' As estado, 'BRASIL' As pais
	Union
	Select 'NITER�I' As cidade, 'RJ' As estado, 'BRASIL' As pais
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
       "estado":null, --> O atributo estado para esse objeto apareceu devido ao uso da cl�usula Include_null_values
       "pais":"ESPANHA"
    },
    {
       "cidade":"NITER�I",
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
       "cidade":"S�O PAULO",
       "estado":"SP",
       "pais":"BRASIL"
    }
 ]
*/
----------------------------------------------------------------------------------
-- WITHOUT_ARRAY_WRAPPER: utilizado para que o json seja retornado sem os '[]', por�m caso exista mais de um objeto, 
-- o json n�o ser� v�lido, no caso, esse recurso deve ser utilizado quando a consulta retorna apenas um resultado e 
-- se for necess�rio. 

----------------------------------------------------------------------------------
-- Exemplo de utiliza��o do ROOT('NOME'), respons�vel por envolver o objeto dentro de um objeto raiz, nomeado no par�metro
----------------------------------------------------------------------------------
SELECT Geo.* 
from 
(
  SELECT 'RIO DE JANEIRO' AS CIDADE, 'RJ' AS ESTADO,'BRASIL' AS PAIS
) Geo FOR JSON AUTO, ROOT('Geografia');
----------------------------------------------------------------------------------
-- Json de sa�da
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