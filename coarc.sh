#!/bin/bash

HASH=`md5sum composer.lock | cut -d ' ' -f 1`

LINK=`grep $HASH.zip coarc.lock`

if [ -z "${LINK}" ]; then
    composer install --no-scripts --ignore-platform-reqs

    echo "Execute zip -qr $HASH ./vendor"
    
    zip -qr $HASH ./vendor

    echo "curl --upload-file ./$HASH.zip https://transfer.sh/$HASH.zip > coarc.lock"

    curl --upload-file ./$HASH.zip https://transfer.sh/$HASH.zip > coarc.lock
    
    exit
fi

echo "Execute wget $LINK"

wget $LINK

echo "Execute unzip -oq $HASH.zip && rm -rf $HASH.zip"

unzip -oq $HASH.zip && rm -rf $HASH.zip

composer dump-autoload
