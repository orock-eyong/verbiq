# Verbiq - AI Text Analysis Portal
![AWS](https://img.shields.io/badge/AWS-Serverless-orange)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-yellow)
![API Gateway](https://img.shields.io/badge/AWS-API_Gateway-red)
![S3](https://img.shields.io/badge/AWS-S3-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

Instant document analysis for students, recruiters and content creators.

🌐 **Live at:** https://verbiq.pages.dev

## Features
- Word count, reading time, readability score
- Language detection
- AI-powered summary (TextRank)
- Keyword extraction (TF-IDF)
- CV parsing (name, email, phone, skills, experience)
- Downloadable HTML report
- Supports TXT, PDF, DOCX

## Architecture
- **Frontend:** Cloudflare Pages (free)
- **API:** AWS API Gateway + Lambda (free tier)
- **Storage:** S3 with auto-delete TTL (free tier)
- **Database:** DynamoDB with TTL (free tier)
- **Notifications:** SNS email (free tier)

## Deployment

### Step 1 - Build Lambda Layer
Open AWS CloudShell in eu-west-3 and run:
```bash
bash scripts/build-layer.sh
---

Copy the Layer ARN from the output.

### Step 2 - Deploy CloudFormation Stack
1. Go to CloudFormation in eu-west-3
2. Create stack using infrastructure/verbiq-template.yaml
3. Fill in parameters including the Layer ARN from Step 1
4 Wait for CREATE_COMPLETE

### Step 3 - Update Frontend

Copy the three URLs from the CloudFormation Outputs tab and
update these lines in index.html:
