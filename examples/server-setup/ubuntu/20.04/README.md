### Server Setup

1. Create a python virtual environment.

```zsh
$ python3 -m venv venv
$ source venv/bin/activate
```

2. Install `ansible`

```zsh
$ make config
```

3. Create `hosts.prod` from `hosts` file and replace `127.0.0.1` with the host IP.

4. Create `prod.vault.yml` with these configs.

```zsh
$ ansible-vault create prod.vault.yml
```

```yaml
install_mysql: true
root_username: root
root_password: R2ZBmTR6nED6a71AxeTO2DSck
app_db_name: helium
app_db_username: admin
app_db_password: R2ZBmTR6nED6a71AxeTO2UIok
allow_access_from: "127.0.0.1"

install_nginx: true

install_php: true
php_version: 7.4

install_composer: true

install_postfix: false
postfix_hostname: helium
smtp_sasl_security_options: noanonymous
smtp_sasl_auth_enable: 'yes'
smtp_use_tls: 'yes'
smtp_server: smtp.gmail.com
smtp_port: 587
smtp_username: ''
smtp_password: ''
inet_interfaces: 127.0.0.1
```

`Postfix` is disabled but it can be enabled by setting `install_postfix: true` above and providing the SMTP Server, username and password. You can use your gmail account as an SMTP server by doing the following:

- The `SMTP server` will be `smtp.gmail.com` and port `587`
- The `SMTP username` is your gmail email address.
- The `SMTP password` can be generated after enabling two factor authentication. Please check this guide to generate the app password https://www.golinuxcloud.com/gmail-smtp-relay-server-postfix/.

5. Run ansible playbook to setup the server

```zsh
$ make prod
```

Here is an [article explaining the above steps in more details](https://clivern.com/installing-nginx-mysql-php-on-ubuntu-22-04/)
