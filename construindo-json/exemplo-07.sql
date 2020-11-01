/*
	No SqlServer, n�o existe um tipo espec�fico "JSON", os arquivos s�o tratados como varchar. 
	Por�m, � poss�vel analisarmos a estrutura do varchar para identificar se o mesmo � um objeto json. 
*/

Select 
	ConfirmedReceivedBy,
	(Case When Isjson(ConfirmedReceivedBy) = 1 Then '� Json' Else 'N�o � Json' End) ReceivedByIsJson,
	ReturnedDeliveryData,
	(Case When Isjson(ReturnedDeliveryData) = 1 Then '� Json' Else 'N�o � Json' End) DeliveryDataIsJson
From sales.Invoices