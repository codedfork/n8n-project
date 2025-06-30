#!/bin/sh

docker exec n8n n8n export:workflow --all --output=/home/node/.n8n/workflows.json
git add .n8n/workflows.json
git commit -m "Auto: exported and updated workflows"
git push 