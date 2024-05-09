#!/bin/sh
cat > ./job.yml <<EOF
\$schema: https://azuremlschemas.azureedge.net/latest/commandJob.schema.json
code: model
environment_variables:
  SERVICE_PRINCIPAL_ID: $SERVICE_PRINCIPAL_ID
  SERVICE_PRINCIPAL_PASSWORD: $SERVICE_PRINCIPAL_PASSWORD
  TENANT_ID: $TENANT_ID
  SUBSCRIPTION_ID: $SUBSCRIPTION_ID
  RESOURCE_GROUP: $RESOURCE_GROUP
  WORKSPACE_NAME: $WORKSPACE_NAME

command: >-
  python train.py

environment: azureml://registries/azureml/environments/AzureML-AutoML/versions/142
compute: azureml:shared-runner-1
experiment_name: bank-data-example
description: Train a classification model on bank data
EOF
