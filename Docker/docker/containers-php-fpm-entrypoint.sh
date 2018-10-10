#!/bin/bash
set -e

if [ -z "$SMTP_HOST" ]; then
	echo "No smtp host provided";
	exit 1;
fi

rm /etc/ssmtp/revaliases
rm /etc/ssmtp/ssmtp.conf
cat <<EOF >> /etc/ssmtp/revaliases
root:$SMTP_USER:$SMTP_HOST
EOF

cat <<EOF >> /etc/ssmtp/ssmtp.conf
root=postmaster
mailhub=$SMTP_HOST
AuthUser=$SMTP_USER
AuthPass=$SMTP_PASSWORD
FromLineOverride=YES
#Debug=YES
hostname=docker.acti
EOF

exec "$@"