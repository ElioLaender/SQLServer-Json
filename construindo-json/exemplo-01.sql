-- For Json Auto: Cláusula do SQLServer que permite que uma projeção seja transformada em JSON, sendo aplicada da seguinte forma:
------------------------------------------------------
-- Consulta
------------------------------------------------------
use WideWorldImporters;
Select Top 2 CustomerName, PrimaryContact, AlternateContact, PhoneNumber
From Website.Customers
For Json Auto;
------------------------------------------------------
-- Json Gerado
-- Site para idendar e visualizar json: https://jsonformatter.curiousconcept.com
------------------------------------------------------
/*
[
   {
      "CustomerName":"Tailspin Toys (Head Office)",
      "PrimaryContact":"Waldemar Fisar",
      "AlternateContact":"Laimonis Berzins",
      "PhoneNumber":"(308) 555-0100"
   },
   {
      "CustomerName":"Tailspin Toys (Sylvanite, MT)",
      "PrimaryContact":"Lorena Cindric",
      "AlternateContact":"Hung Van Groesen",
      "PhoneNumber":"(406) 555-0100"
   }
]
*/
------------------------------------------------------

-- Ps: O MSSQL Manager Studio, irá informar uma opção para exibir viar editor XML, porém na verdade estamos lidando com um arquivo json. 
-- Cada elemento do array, equivale a uma linha da tabela. Sendo o nome da coluna no atributo do objeto e o valor da tupla o valor setado no mesmo. 