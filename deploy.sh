#!/bin/bash
set -ex

jekyll build

gsutil -m rsync -d -r ./_site gs://php.chingr.com
