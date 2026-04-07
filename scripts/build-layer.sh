#!/bin/bash
# Verbiq Lambda Layer Builder
# Run this in AWS CloudShell in eu-west-3 before deploying the stack
set -e

rm -rf ~/verbiq-layer-final
mkdir -p ~/verbiq-layer-final/python/lib/python3.11/site-packages

python3.9 -m pip install pypdf \
  --platform manylinux2014_x86_64 \
  --target ~/verbiq-layer-final/python/lib/python3.11/site-packages \
  --implementation cp \
  --python-version 3.11 \
  --only-binary=:all: \
  --quiet && echo "pypdf installed"

cd ~/verbiq-layer-final
zip -r verbiq-layer-final.zip python/ --quiet && echo "Zip done"

REGION="eu-west-3"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
LAYER_BUCKET="verbiq-layer-${ACCOUNT_ID}-${REGION}"

aws s3 mb s3://${LAYER_BUCKET} --region ${REGION} 2>/dev/null || true
aws s3 cp ~/verbiq-layer-final/verbiq-layer-final.zip s3://${LAYER_BUCKET}/verbiq-layer-final.zip

LAYER_ARN=$(aws lambda publish-layer-version \
  --layer-name verbiq-document-parser \
  --description "pypdf only - Verbiq final" \
  --content S3Bucket=${LAYER_BUCKET},S3Key=verbiq-layer-final.zip \
  --compatible-runtimes python3.11 \
  --region ${REGION} \
  --query LayerVersionArn \
  --output text)

echo ""
echo "============================================"
echo "Layer ARN: ${LAYER_ARN}"
echo "============================================"
echo "Paste this ARN as DocumentParserLayerArn when deploying the CloudFormation stack"
