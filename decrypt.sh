#!/bin/sh
TAR_FILENAME=$2
SECRET_KEY=secret.key
RANDOM_KEY=random.key
printf "Doing decrytion of random key.\n"
openssl rsautl -decrypt -inkey $SECRET_KEY -in $RANDOM_KEY.enc -out $RANDOM_KEY
printf "Doing decryption of $1.\n"
openssl enc -d -a -aes-256-cbc -in $1 -out $TAR_FILENAME -pass file:$RANDOM_KEY
printf "Done.\n"
