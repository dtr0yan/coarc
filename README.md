# coarc
Shell script that can reduce first composer install time.

The idea to create this script came when I had got tired to wait composer installing on every GITLAB build.
This script is trying to achieve  https://www.npmjs.com/package/freight functionality in light manner.

When you will start coarc.sh first time it will install dependencies with composer, archive them and send it to transfer.sh. Then it will create coarc.lock file with link to transfer.sh (you need to add this file to repository).

Next time you will execute it it will try to download archived dependencies (one file only).
And it's much faster in case you don't have cached dependencies on this machine (in my case it was GITLAB docker).

How to use
``
sh coarc.sh
``
run this script in folder that contains composer.json
