/*
	Exemplo de como adicionar nova propriedade e valor em objetos json
	Para essa função, temos a função json_modify
*/


-- As alterações reflete em todos objetos da coluna (Quando o atributo já existe, o valor é modificado pelo novo valor setado)
Select UserPreferences From Application.People
Select UserPreferences, Json_modify(UserPreferences,'$.color', 'blue') As NewUserPreferences From Application.People
Select UserPreferences, Json_modify(UserPreferences, '$.table.pagesize', 'A4') As NewUserPreferences From Application.People


-- Removendo a propriedade de um valor (basta passar null para um atributo já existente)
Select UserPreferences, Json_modify(UserPreferences,'$.color', null) As NewUserPreferences From Application.People

-- Adicionando um novo elemento, dentro de uma propriedade já existente, por exemplo, adicionar um valor em um atributo que contém um array
Select CustomFields, 
Json_modify(CustomFields, 'append $.OtherLanguages', 'Greek') As new_json From Application.People -- Foi acrescentado o append antes da referência do atributo. 
Where FullName = 'Ronan Carlitos'




/* 
	Modificação de várias propriedades em uma consulta

	-- Json de exemplo:
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
*/

	SELECT 
	JSON_MODIFY(
	JSON_MODIFY(
	JSON_MODIFY(PROJETO,'$.Nome_Departamento', 'desenvolvimento')
	,'append $.Projeto',JSON_QUERY(' {
		  "Numero_Projeto": "4",
		  "Nome_Projeto": "Produto W",
		  "Local_Projeto": "Santos"
		}') -- Adiciona o projeto
	) -- Altera o nomedo departamento
	,'$.Cpf_Gerente', null) -- remove gerente
	AS NOVO_JSON
	FROM EMPRESA

/*
	{
	  "Numero_Departamento": "5",
	  "Data_Inicio_Gerente": "1988-05-22",
	  "Nome_Departamento": "desenvolvimento",
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
		},
		{
		  "Numero_Projeto": "4",
		  "Nome_Projeto": "Produto W",
		  "Local_Projeto": "Santos"
		}
	  ]
	}
*/












-- Verificar se é possível realizar um filtro com stract, para alterar apenas os jsons retornados pelo filtro. 