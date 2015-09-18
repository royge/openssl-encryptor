#!/bin/sh

# Sample Usage
# ./encrypt.sh tmp.tar.gz

TAR_FILENAME=$1
RANDOM_KEY=random.key
PUB_KEY=public.key
ENC_FILENAME="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)".enc
printf "Generating random key.\n"
openssl rand -base64 128 > $RANDOM_KEY
printf "Done.\n"
printf "Doing encryption.\n"
openssl enc -aes-256-cbc -a -salt -in $TAR_FILENAME -out $ENC_FILENAME -pass file:$RANDOM_KEY
printf "Done.\n"
printf $ENC_FILENAME" successfully created.\n"
printf "Encrypting random key.\n"
openssl rsautl -encrypt -inkey $PUB_KEY -pubin -in $RANDOM_KEY -out $RANDOM_KEY.enc
printf "Done.\n"

