# Verbiq - AI Text Analysis Portal

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
