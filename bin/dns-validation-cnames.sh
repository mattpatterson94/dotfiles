#!/usr/bin/env bash

# Shamelessly lifted from https://github.com/envato/redirector

# Usage: aws-vault exec <target-account> -- ./get-dns-validation-cnames.sh "my.domain.envato.net"

if [[ -z "${AWS_DEFAULT_REGION}" ]]; then
  echo "Region needs to be specified using AWS_DEFAULT_REGION."
  exit 1
fi

if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
  echo "You need to have AWS access configured in environment variables."
  exit 1
fi

set -euo pipefail

if aws sts get-caller-identity --query 'Arn' --output text | grep -vq "power-user" ; then
  echo "You're not using a power-user role. You need to be able to "
  echo "delete the temporary certificate at the end."
  read -n 1 -s -r -p "Press ctrl+c to cancel or enter to continue."
  echo
fi

DOMAIN_NAME=$1

if [[ -z "${DOMAIN_NAME}" ]]; then
  echo "Usage: $0 DOMAIN_NAME"
  echo
  exit 1
fi

echo "Creating temporary certificate.."

ARN=$(aws acm request-certificate \
  --validation-method DNS \
  --domain-name ${DOMAIN_NAME} \
  --query 'CertificateArn' \
  --output text
)

USERNAME=$(git config --global user.email || echo $USER)

aws acm add-tags-to-certificate \
  --tags Key=Name,Value="temp-cert-${DOMAIN_NAME}-${USERNAME}" \
  --certificate-arn ${ARN}

echo "Getting DNS validation information.."
sleep 5 # Takes a sec for the CNAME to become available

CNAME=$(aws acm describe-certificate \
  --certificate-arn ${ARN} \
  --output text \
  --query 'Certificate.DomainValidationOptions[].ResourceRecord[].{cname:Name}')

TARGET=$(aws acm describe-certificate \
  --certificate-arn ${ARN} \
  --output text \
  --query 'Certificate.DomainValidationOptions[].ResourceRecord[].{target:Value}')

echo ""
echo "Temporary certificate ARN: ${ARN}"
echo ""
echo "CNAME: ${CNAME}"
echo "Target: ${TARGET}"
echo ""
read -n 1 -s -r -p "Copy the above information then press any key to remove the temporary certificate"

echo ""
echo "Cleaning up temporary certificate.."
aws acm delete-certificate \
  --certificate-arn ${ARN}

echo ""
echo "Done"

