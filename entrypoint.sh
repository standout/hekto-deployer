#!/bin/sh -l

echo "Token: $1"
echo "Source: $2"
echo "Url: $3"

apk add curl
apk add git
apk add jq

file_name="package.tar.gz"
tar -zcvf $file_name $2
git_hash=$(git rev-parse --short "$GITHUB_SHA")
file_size=$(stat -c%s "$file_name")

echo $file_name
echo $file_size
echo $git_hash

response=$(curl -X POST -d file_name=$file_name -d file_size=$file_size -d commit=$git_hash $3/sv/api/v1/deployment -H "Authorization: Bearer $1")

echo $response > response.json
url=$(jq -r '.url' response.json)
deployment=$(jq -r '.deployment' response.json)

echo $url
echo $deployment

s3_response=$(curl -T $file_name $url)
echo $s3_response

curl=$(curl -X PUT $3/sv/api/v1/deployment/$deployment -H "Authorization: Bearer $1")
echo $curl
