/*
	Recuperando valores específicos do Json
*/

Declare @json Varchar(max)

Set @json = '{
  "CustomerName": "Tailspin Toys (Head Office)",
  "PrimaryContact": "Waldemar Fisar",
  "AlternateContact": "Laimonis Berzins",
  "PhoneNumber": [
    "(308) 555-0100",
    "(308) 222-4436"
  ],
  "Address": {
    "Street": "1St Canal",
    "Number": 23,
    "City": "Atlanta"
  },
  "Invoices": [
    {
      "InvoiceDate": "2013-03-14",
      "InvoiceValue": 22500,
      "InvoiceProducts": [
        {
          "NameProduct": "Fruit Juice",
          "Value": 12500
        },
        {
          "NameProduct": "Ice Tea",
          "Value": 10000
        }
      ]
    },
    {
      "InvoiceDate": "2014-04-12",
      "InvoiceValue": 20000,
      "InvoiceProducts": [
        {
          "NameProduct": "Soda",
          "Value": 15000
        },
        {
          "NameProduct": "Ice Tea",
          "Value": 5000
        }
      ]
    }
  ]
}'

-- Acessando atributos específicos do objeto
Select Json_value(@json, '$.CustomerName')
Select Json_value(@json, '$.Invoices[0].InvoiceProducts[0].NameProduct')

-- Exemplo de uma consulta extraindo apenas os objetos json que atenda um determinado filtro, para essa tarefa, existe a função json_extract
-- SELECT JSON_VALUE(@JSON, '$.Nome_Departamento') 
-- FROM tb_object_departamento
-- WHERE YEAR(JSON_EXTRACT(@JSON,'$.Data_Inicio_Gerente')) = 2005


-- PS: Verificar se é possível retornar a quantidade de elementos em um atributo que contém um array de objetos e iterar pelo mesmo através de um cursor. 
-- Caso seja necessário retornar uma estrutura, é necessário utilizar o json_query, pois como o nome sugere, o json_value retorna apenas valores, retornando null quando não consegue acessar valores
-- setados nos atributos. 
-- Exemplo de uso:
Select Json_query(@json, '$.Invoices[0].InvoiceProducts[0]')

