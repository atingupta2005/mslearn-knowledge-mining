#!/bin/bash

# Set values for your Search service
url="$WORDCOUNT_FUNCTION_APP_URL"
admin_key="$AI_SEARCH_ADMIN_KEY"

echo "-----"
echo "Updating the skillset..."
curl -X PUT "$url/skillsets/margies-custom-skillset?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d @update-skillset.json

echo "-----"
echo "Updating the index..."
curl -X PUT "$url/indexes/margies-custom-index?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d @update-index.json

echo "-----"
echo "Updating the indexer..."
curl -X PUT "$url/indexers/margies-custom-indexer?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d @update-indexer.json

echo "-----"
echo "Resetting the indexer..."
curl -X POST "$url/indexers/margies-custom-indexer/reset?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"

echo "-----"
echo "Rerunning the indexer..."
curl -X POST "$url/indexers/margies-custom-indexer/run?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"
