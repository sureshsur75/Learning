# Sudoers template for Oracle DB on RHEL 8.0 and later

# Place this content in /etc/sudoers.d/oracle or append to /etc/sudoers using visudo

oracle ALL=(ALL)       NOPASSWD: /bin/systemctl start oracle*, /bin/systemctl stop oracle*, /bin/systemctl restart oracle*, /bin/systemctl status oracle*, /usr/bin/crontab, /usr/bin/passwd, /usr/bin/chown, /usr/bin/chmod, /usr/bin/chgrp, /usr/bin/kill, /usr/bin/killall, /usr/bin/ls, /usr/bin/cp, /usr/bin/mv, /usr/bin/rm, /usr/bin/tar, /usr/bin/gzip, /usr/bin/gunzip, /usr/bin/vi, /usr/bin/nano

# ...add or remove commands as per your Oracle DB operational requirements...
