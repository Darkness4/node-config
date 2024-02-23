#!/bin/sh

cat <<EOF >/etc/motd
------------------------
My super light OS. Easy to update.
Hostname: $(hostname)
------------------------
EOF
