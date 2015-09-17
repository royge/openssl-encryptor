#!/bin/sh

# Generate secret key
openssl genrsa -des3 -out secret.key 2048

# Generate public key
openssl rsa -in secret.key -out public.key -outform PEM -pubout
