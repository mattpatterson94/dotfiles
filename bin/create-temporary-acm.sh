#!/usr/bin/env bash

DOMAIN_NAME=$1

if [[ -z "${DOMAIN_NAME}" ]]; then
  echo "Usage: $0 DOMAIN_NAME"
  echo
  exit 1
fi

ARN=$(aws acm request-certificate \
  --validation-method DNS \
  --domain-name ${DOMAIN_NAME} \
  --query 'CertificateArn' \
  --output text
)

echo "Temporary certificate ARN: ${ARN}"
echo

USERNAME=$(git config --global user.email || echo $USER)

aws acm add-tags-to-certificate \
  --tags Key=Name,Value="temp-cert-${DOMAIN_NAME}-${USERNAME}" \
  --certificate-arn ${ARN}

# To generate a temporary cert for ALL redirector domains:
# MAIN_SITE_NAME=$(grep 'domain_name:' ./infrastructure/stacks/parameters/us-east-1/redirector_dns.yml | cut -d' ' -f2,2)
# DOMAINS=$(grep '".*",$' infrastructure/stacks/templates/redirector_acm_via_dns.rb | tr -d '"' | tr -d ' ' | tr -d , | tr '\n' ' ')
# aws acm request-certificate --validation-method DNS --domain-name ${MAIN_SITE_NAME} --subject-alternative-names ${DOMAINS} --query 'CertificateArn' --output text
