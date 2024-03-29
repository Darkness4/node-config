#!/bin/sh

chmod +x ./post.sh
if ./post.sh | tee /var/log/gitops.log; then
  curl -F "file1=@/var/log/gitops.log" -F 'payload_json={"content":"GitOps: Success"}' https://en08lc5cdlo763.x.pipedream.net
else
  curl -F "file1=@/var/log/gitops.log" -F 'payload_json={"content":"GitOps: Failure"}' https://en08lc5cdlo763.x.pipedream.net
fi
