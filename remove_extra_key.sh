echo 'Stripping company data to essentials'
jq 'map(del(._highlightResult))' ./data/combined_companies_data.json > ./data/yc_essential_data.json
echo 'Stripping JSON data complete'