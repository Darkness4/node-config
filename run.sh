#!/bin/sh

cat <<EOF >/etc/motd
------------------------
My super light OS.
Hostname: $(hostname)
------------------------
EOF
