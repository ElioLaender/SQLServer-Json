/*
	No SqlServer, não existe um tipo específico "JSON", os arquivos são tratados como varchar. 
	Porém, é possível analisarmos a estrutura do varchar para identificar se o mesmo é um objeto json. 
*/

Select 
	ConfirmedReceivedBy,
	(Case When Isjson(ConfirmedReceivedBy) = 1 Then 'É Json' Else 'Não é Json' End) ReceivedByIsJson,
	ReturnedDeliveryData,
	(Case When Isjson(ReturnedDeliveryData) = 1 Then 'É Json' Else 'Não é Json' End) DeliveryDataIsJson
From sales.Invoices