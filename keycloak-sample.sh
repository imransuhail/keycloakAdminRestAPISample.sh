#!/bin/bash

export TKN=$(curl -X POST 'http://localhost:8080/auth/realms/master/protocol/openid-connect/token' \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d 'password=admin' \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

curl -X GET 'http://localhost:8080/auth/admin/realms' \
-H "Accept: application/json" \
-H "Authorization: Bearer $TKN" | jq .