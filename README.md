# n8n Project Workflow Versioning

## Project Structure

```
n8n-project/
├── docker-compose.yml
├── .n8n/                   # All workflow data stored here
│   └── workflows.json      # Exported workflows
├── .gitignore
└── README.md
```

## Setup & Run

```bash
docker-compose up
```
Visit: [http://localhost:5678](http://localhost:5678)

## Export Workflows
After editing workflows in the UI, run:
```bash
docker exec n8n n8n export:workflow --all --output=/home/node/.n8n/workflows.json
```

## Version Control
```bash
git add .n8n/workflows.json
git commit -m "Updated workflows"
git push origin main
```

## Import Workflows (for collaborators)
```bash
docker exec n8n n8n import:workflow --input=/home/node/.n8n/workflows.json --overwrite
```

## Optional: Automation Script
Create `export-and-push.sh`:
```bash
docker exec n8n n8n export:workflow --all --output=/home/node/.n8n/workflows.json
git add .n8n/workflows.json
git commit -m "Auto: exported and updated workflows"
git push
```
Run it after every change: `bash export-and-push.sh` 