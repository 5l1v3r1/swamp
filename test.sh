#!/bin/bash

spyonweb_token=$1
test_id=UA-6888464-2
test_url=infowars.com

echo "Testing urlscan.io (default) with -id"
python swamp.py -id $test_id
echo
echo "Testing urlscan.io (default) with -url"
python swamp.py -url $test_url

echo "Testing urlscan.io (explicit) with -id"
python swamp.py -id $test_id -urlscan
echo
echo "Testing urlscan.io (explicit) with -url"
python swamp.py -url $test_url -urlscan


echo "Testing SpyOnWeb with -id"
python swamp.py -id $test_id -spyonweb -token $spyonweb_token
echo
echo "Testing SpyOnWeb with -url"
python swamp.py -url $test_url -spyonweb -token $spyonweb_token
