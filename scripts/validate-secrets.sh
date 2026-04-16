#!/bin/bash

REQUIRED_SECRETS=("API_KEY" "DB_URL")

for secret in "${REQUIRED_SECRETS[@]}"
do
  if [ -z "${!secret}" ]; then
    echo "❌ Missing secret: $secret"
    exit 1
  fi
done

echo "✅ All required secrets are present"
