echo "10.102.0.172 puppet" >> /etc/hosts
systemctl start puppet
systemctl start httpd
