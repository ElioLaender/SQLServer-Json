-----------------------------------------------------
-- ** Verificar: Foi reconhecido de acordo com o join que os valores dos outros atributos seriam sempre os mesmos?
-- R: De acordo com teste realizado, foi constatado que para cada mudança de valor na tupla, um novo objeto é gerado e adicionado no array de objetos JSON, exemplo:
-----------------------------------------------------
-- Consulta de teste com valores diferentes
-----------------------------------------------------
Select db_name() as [Database],
sys.schemas.name, 
sys.objects.name, 
sys.columns.name 
From sys.objects
Join sys.schemas On sys.objects.schema_id = sys.schemas.schema_id
Join sys.columns On sys.columns.object_id = sys.objects.object_id 
where sys.schemas.name in ('Warehouse', 'Sales')

-----------------------------------------------------
-- Resumo do json gerado 
-----------------------------------------------------
/*
[
    {
        "Database": "WideWorldImporters",
        "name": "Sales",
        "sys.objects": [
            {
                "name": "BuyingGroups",
                "sys.columns": [
                    {
                        "name": "BuyingGroupID"
                    },
                    {
                        "name": "BuyingGroupName"
                    },
                    {
                        "name": "LastEditedBy"
                    },
                    {
                        "name": "ValidFrom"
                    },
                    {
                        "name": "ValidTo"
                    }
                ]
            },
            {
                "name": "BuyingGroups_Archive",
                "sys.columns": [
                    {
                        "name": "BuyingGroupID"
                    },
                    {
                        "name": "BuyingGroupName"
                    },
                    {
                        "name": "LastEditedBy"
                    },
                    {
                        "name": "ValidFrom"
                    },
                    {
                        "name": "ValidTo"
                    }
                ]
            }
        ]
    },
    {
        "Database": "WideWorldImporters",
        "name": "Warehouse",
        "sys.objects": [
            {
                "name": "ColdRoomTemperatures",
                "sys.columns": [
                    {
                        "name": "ColdRoomSensorNumber"
                    },
                    {
                        "name": "ColdRoomTemperatureID"
                    },
                    {
                        "name": "RecordedWhen"
                    },
                    {
                        "name": "Temperature"
                    },
                    {
                        "name": "ValidFrom"
                    },
                    {
                        "name": "ValidTo"
                    }
                ]
            },
            {
                "name": "ColdRoomTemperatures_Archive",
                "sys.columns": [
                    {
                        "name": "ColdRoomSensorNumber"
                    },
                    {
                        "name": "ColdRoomTemperatureID"
                    },
                    {
                        "name": "RecordedWhen"
                    },
                    {
                        "name": "Temperature"
                    },
                    {
                        "name": "ValidFrom"
                    },
                    {
                        "name": "ValidTo"
                    }
                ]
            }
        ]
    }
]
*/
-----------------------------------------------------