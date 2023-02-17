#!/bin/bash

if [ -n "${OPENAI_API_KEY}" ];then
  sed -i "s#openai-api-key#${OPENAI_API_KEY}#g" /data/.env
  npm run dev
else
  echo "Environment variable "OPENAI_API_KEY" not set."
  exit 1
fi

 
