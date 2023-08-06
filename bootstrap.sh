#!/bin/bash

certbot certonly \
  --non-interactive \
  --agree-tos \
  --email "myphotodir@outlook.com" \
  --preferred-challenges dns \
  --dns-porkbun-key "pk1_fa1febd00c0c8d38887a6dd56b1f7229386e7ce334390c7b45ce916dc41262f7"   \
  --dns-porkbun-secret "sk1_208c1a41106031a3d83c3016d39b11fb9cd57fc125bae0b8fd9c2c071d6390d3" \
  --authenticator dns-porkbun \
  --dns-porkbun-propagation-seconds 60 \
  -d "todo.plok.work"  \
  --staging