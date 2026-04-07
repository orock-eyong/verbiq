# Verbiq - AI Text Analysis Portal
![AWS](https://img.shields.io/badge/AWS-Serverless-orange)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-yellow)
![API Gateway](https://img.shields.io/badge/AWS-API_Gateway-red)
![S3](https://img.shields.io/badge/AWS-S3-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

Verbiq is a serverless AI-powered text analysis platform that delivers instant insights from documents—built for students, recruiters, and content creators.

🌐 **Live at:** https://verbiq.pages.dev

## ✨ Features
- 📊 **Readability Insights** — word count, reading time, readability score
- 🌍 **Language Detection** — automatic language identification
- 🧠 **AI Summarisation** — TextRank-based summaries
- 🔑 **Keyword Extraction** — TF-IDF powered key phrase detection
- 📄 **CV Parsing** — extract name, email, phone, skills, and experience
- 📥 **Export Reports** — downloadable HTML reports
- 📁 **Multi-format Support** — TXT, PDF, DOCX

## 🏗️ Architecture

Fully serverless, cost-efficient, and scalable:

- **Frontend**: Cloudflare Pages
- **API Layer**: AWS API Gateway
- **Compute**: AWS Lambda
- **Storage**: Amazon S3 (TTL auto-cleanup)
- **Database**: DynamoDB (TTL enabled)
- **Notifications**: SNS (email alerts)

## ⚙️ Deployment Guide

### 1. Build Lambda Layer
Open AWS CloudShell in eu-west-3 and run:

```bash
bash scripts/build-layer.sh
```
Copy the Layer ARN from the output.

### 2. Deploy Infrastructure (CloudFormation)
- **1**.   Open AWS CloudFormation (region: eu-west-3)
- **2**. Create a new stack using:
  -  infrastructure/verbiq-template.yaml
-  **3**. Provide required parameters (including Layer ARN)
-  **4**. Wait for CREATE_COMPLETE

### 3 - Update Frontend

Update API endpoints in index.html:

const UPLOAD_URL   = "https://YOUR_API/upload";
const ANALYSE_URL  = "https://YOUR_API/analyse";
const DOWNLOAD_URL = "https://YOUR_API/download";

Commit to GitHub and Cloudflare auto-deploys in 30 seconds.

### TTL Settings

Data	Auto-deleted after
Uploaded files (S3)	1 day
Analysis reports (S3)	7 days
Metadata (DynamoDB)	7 days

### Roadmap
- Phase 2: Amazon Comprehend for sentiment and entity extraction
- Phase 3: Cognito for user authentication
- Phase 4: Custom domain verbiq.com

## Summary

| File | Purpose |
|---|---|
| `index.html` | The entire frontend |
| `infrastructure/verbiq-template.yaml` | Everything AWS |
| `scripts/build-layer.sh` | Layer rebuild script |
| `README.md` | Deployment instructions |

