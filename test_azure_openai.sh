#!/usr/bin/env bash

ENDPOINT=https://myname.openai.azure.com/
API_VERSION=2025-03-01-preview
MODEL=gpt-4o
ENDPOINT=https://myname.openai.azure.com

if [ -z "${AZURE_API_KEY}" ]; then
  echo "AZURE_API_KEY not defined"
  exit 1
fi

echo Test /models
URL=${ENDPOINT}/openai/models?api-version=${API_VERSION} 
echo $URL
curl -X GET ${URL} \
 -H "Content-Type: application/json" \
 -H "api-key: ${AZURE_API_KEY}" 
echo

echo Test /chat/completions
URL=${ENDPOINT}/openai/deployments/${MODEL}/chat/completions?api-version=${API_VERSION}
echo $URL
curl -X POST $URL \
 -H "Content-Type: application/json" \
 -H "api-key: ${AZURE_API_KEY}" \
 -d '{"messages":[{"role":"user", "content": "Tell me a joke"}]}'
echo

echo Test /responses
URL=${ENDPOINT}/openai/responses?api-version=${API_VERSION}
echo $URL
curl -X POST $URL \
 -H "Content-Type: application/json" \
 -H "api-key: ${AZURE_API_KEY}" \
 -d "{\"model\": \"${MODEL}\", \"input\": \"write me a hello world script in Bash. Return the code without markdown or commenting.\"}"
echo


