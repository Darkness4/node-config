#!/bin/sh

chmod +x ./post.sh
./post.sh | tee /var/log/gitops.log
if [ $? -eq 0 ]; then
  curl -X POST -H "Content-Type: application/json" -F "file1=/var/log/gitops.log" -d '{"content":"GitOps: Success"}' https://en08lc5cdlo763.x.pipedream.net
else
  curl -X POST -H "Content-Type: application/json" -F "file1=/var/log/gitops.log" -d '{"content":"GitOps: Failure"}' https://en08lc5cdlo763.x.pipedream.net
fi
