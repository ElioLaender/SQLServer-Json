/*
	Utilizando o Openjson() para transformar json em tabela (retornar valores tipados na projeção)

	Segue um exemplo de json armazenado na tabela EMPRESA no atributo DEPARTAMENTO

	{
	  "Numero_Departamento": "5",
	  "Data_Inicio_Gerente": "1988-05-22",
	  "Nome_Departamento": "Pesquisa",
	  "Cpf_Gerente": "33344555587",
	  "Projeto": [
		{
		  "Numero_Projeto": "2",
		  "Nome_Projeto": "Produto Y",
		  "Local_Projeto": "Itu"
		},
		{
		  "Numero_Projeto": "3",
		  "Nome_Projeto": "Produto Z",
		  "Local_Projeto": "São Paulo"
		}
	  ]
	}


	----------------------------------------------------------
	-- Criação da tabela com base nos atributos extraídos
	----------------------------------------------------------

	SELECT 
	Departamento.Nome_Departamento
	, Departamento.NUmero_Projeto_1
	, Departamento.Numero_Projeto_2 FROM EMPRESA 
	CROSS APPLY OPENJSON (DEPARTAMENTO) WITH
	(Nome_Departamento varchar(20) '$.Nome_Departamento',
	Numero_Projeto_1 varchar(20) '$.Projeto[0].Numero_Projeto',
	Numero_Projeto_2 varchar(20) '$.Projeto[1].Numero_Projeto') AS Departamento


*/

