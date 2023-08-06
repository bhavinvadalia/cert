#!/bin/bash
az login --service-principal -u \
    "a30b9e49-31b9-4005-a6a3-2bf64d5cc59e" \
    -p "elm8Q~JtNMUrmK6zi5jeBxgPjF1sglcTx_seacM7" \
    --tenant "9d39a1bb-2c48-49f8-91b1-d69fb60ebab7"
az account show
# Variables to create AKV cert
pem_file="/etc/letsencrypt/live/${DOMAIN}/fullchain.pem"
key_file="/etc/letsencrypt/live/${DOMAIN}/privkey.pem"
cert_name=$(echo $DOMAIN | tr -d '.')
# Combine PEM and key in one pfx file (pkcs#12)
key_password='usdu6t2l'
pfx_file=".${pem_file}.pfx"
openssl pkcs12 -export -in $pem_file -inkey $key_file -out $pfx_file -passin pass:$key_password -passout pass:$key_password
# Add certificate
az keyvault certificate import --vault-name "$AKV" -n "$cert_name" -f $pfx_file