#!/bin/sh
TAR_FILENAME='tmp.tar.gz'
FOLDER_NAME=$2
SECRET_KEY=secret.key
RANDOM_KEY=random.key
SUFFIX='_bak'
printf "Moving to backup folder.\n"
mv $FOLDER_NAME $FOLDER_NAME$SUFFIX
printf "Doing decrytion of random key.\n"
openssl rsautl -decrypt -inkey $SECRET_KEY -in $RANDOM_KEY.enc -out $RANDOM_KEY
printf "Doing decryption of $1.\n"
openssl enc -d -a -aes-256-cbc -in $1 -out $TAR_FILENAME -pass file:$RANDOM_KEY
printf "Doing extraction.\n"
tar -xvf $TAR_FILENAME
printf "Removing $TAR_FILENAME.\n"
rm -v $TAR_FILENAME
printf "Done.\n"
