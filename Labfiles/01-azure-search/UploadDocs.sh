#!/bin/bash

# Set values for your storage account from environment variables
subscription_id="$SUBSCRIPTION_ID"
azure_storage_account="$AZURE_STORAGE_ACCOUNT_NAME"
azure_storage_key="$AZURE_STORAGE_KEY"

echo "Creating container..."
az storage container create --account-name "$azure_storage_account" --subscription "$subscription_id" --name margies --public-access blob --auth-mode key --account-key "$azure_storage_key" --output none

echo "Uploading files..."
az storage blob upload-batch -d margies -s data --account-name "$azure_storage_account" --auth-mode key --account-key "$azure_storage_key" --output none
