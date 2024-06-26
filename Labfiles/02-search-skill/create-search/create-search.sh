#!/bin/bash

# Set values for your Search service
url="$AI_SEARCH_URL"
admin_key="$AI_SEARCH_ADMIN_KEY"

echo "-----"
echo "Creating the data source..."
curl -X POST "https://ag-ai-search-mar-24.search.windows.net/datasources?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: 760e818a45464965a6adc3e731535594" -d "@data_source.json"

echo "-----"
echo "Creating the skillset..."
curl -X PUT "$url/skillsets/margies-custom-skillset?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d @skillset.json

echo "-----"
echo "Creating the index..."
curl -X PUT "$url/indexes/margies-custom-index?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d @index.json

echo "-----"
echo "Creating the indexer..."
curl -X PUT "$url/indexers/margies-custom-indexer?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d @indexer.json
