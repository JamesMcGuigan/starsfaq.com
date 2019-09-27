#!/bin/bash
set -x
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

#aws s3 cp   ./ s3://aws.starsfaq.com --recursive --acl public-read --exclude ".git" --exclude ".idea" --exclude "logfiles" --exclude "*.log" --exclude "new_site/logfiles/*"
aws s3 sync ./ s3://aws.starsfaq.com --acl public-read --exclude ".git/*" --exclude ".idea/*" --exclude "logs/*" --exclude "*.log" --exclude "new_site/logfiles/*"

