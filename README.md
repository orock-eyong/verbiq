# 🧠 Verbiq — AI-Powered Document Intelligence
<div align="center" style="margin-top:-20px; margin-bottom:-20px;">

<img src="./docs/banner.png" alt="Verbiq Banner" width="100%" />

<b>Turn raw documents into actionable insights — instantly.</b><br/>

<a href="https://verbiq.pages.dev"><strong>🚀 Try Live Demo</strong></a>

</div>

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
  ```bash
  infrastructure/verbiq-template.yaml
  ```
-  **3**. Provide required parameters (including Layer ARN)
-  **4**. Wait for CREATE_COMPLETE

### 3 - Update Frontend

Update API endpoints in index.html:
```bash
const UPLOAD_URL   = "https://YOUR_API/upload";
const ANALYSE_URL  = "https://YOUR_API/analyse";
const DOWNLOAD_URL = "https://YOUR_API/download";
```
Push to GitHub → Cloudflare auto-deploys.

## ⏳Data Lifecycle (TTL)
| Resource              | Retention |
| --------------------- | --------- |
| Uploaded files (S3)   | 1 day     |
| Analysis reports (S3) | 7 days    |
| Metadata (DynamoDB)   | 7 days    |

## 📁 Project Structure

 ```bash
verbiq/
├── index.html
├── infrastructure/
│   └── verbiq-template.yaml
├── scripts/
│   └── build-layer.sh
└── README.md
```

## 🗺️ Roadmap
- 🔍 Sentiment & entity analysis (Amazon Comprehend)
- 🔐 User authentication (Cognito)
- 🌐 Custom domain (verbiq.com)
- 📊 Dashboard analytics



## 📜 License

Licensed under the Apache License, Version 2.0
http://www.apache.org/licenses/
