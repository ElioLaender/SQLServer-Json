-----------------------------------------------------
-- Atenção: Não necessariamente toda consulta será convertida em JSON da maneira informada anteriormente, isso depende de como a consulta é realizada. 
-- Segue o exemplo de uma consulta realizada verificando metadados do SQLServer:
-----------------------------------------------------
-- Consulta exemplo 2
-----------------------------------------------------
Select db_name() as [Database],
sys.schemas.name, 
sys.objects.name, 
sys.columns.name From sys.objects
Join sys.schemas On sys.objects.schema_id = sys.schemas.schema_id
Join sys.columns On sys.columns.object_id = sys.objects.object_id 
Join 
(
  Select Top 1 o.object_id, count(c.name) name from sys.columns c
  Join sys.objects o On c.object_id = o.object_id Where type = 'u' 
  Group By o.object_id Having Count(c.name) < 6
) countCol On countCol.object_id = sys.objects.object_id
Where type = 'u'
For Json Auto
-----------------------------------------------------
-- Json Gerado
-----------------------------------------------------
/*
[
   {
      "Database":"WideWorldImporters",
      "name":"Purchasing",
      "sys.objects":[
         {
            "name":"SupplierCategories",
            "sys.columns":[
               {
                  "name":"SupplierCategoryID"
               },
               {
                  "name":"SupplierCategoryName"
               },
               {
                  "name":"LastEditedBy"
               },
               {
                  "name":"ValidFrom"
               },
               {
                  "name":"ValidTo"
               }
            ]
         }
      ]
   }
]
*/
-----------------------------------------------------
/*
Se tratando de uma consulta mais complexa, o SQLServer gera o Json conforme os joins são projetados, 
no exemplo acima temos o retorno onde o únicos valores que não se repetem são os nomes das colunas, nesse caso foi gerado um sys.columns, 
conforme selecionado e o atributo name setado na forma de um array de objetos
*/
------------------------------------------------------
