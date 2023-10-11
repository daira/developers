#!/usr/bin/env bash

poetry run python3 -m sgqlc.introspection \
  --exclude-deprecated \
  --exclude-description \
  -H "Authorization: bearer $GITHUB_TOKEN" \
  https://api.github.com/graphql \
  github_schema.json

poetry run sgqlc-codegen schema github_schema.json github_schema.py
