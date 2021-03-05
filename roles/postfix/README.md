### Postfix Ansible Role

This role installs Postfix. Available configs to override:

```yaml
postfix_hostname: helium

smtp_sasl_security_options: noanonymous
smtp_sasl_auth_enable: 'yes'
smtp_use_tls: 'yes'

smtp_server: smtp.gmail.com
smtp_port: 587

smtp_username: ''
# please check this guide to generate app password
# for gmail smtp server https://www.golinuxcloud.com/gmail-smtp-relay-server-postfix/
smtp_password: ''

inet_interfaces: 127.0.0.1
```
