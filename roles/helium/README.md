### Application Ansible Role

This role deploys the Helium application. Available configs to override:

```yaml
app_user: appmgmt
app_group: appmgmt

app_version: 0.1.0
git_repo: https://github.com/ionsio/helium.git

workers_counts: 1

hostname: example.com

php_version: 8.1

app_db_name: helium
app_db_username: admin
app_db_password: R2ZBmTR6nED6a71AxeTO2UIo

app_secret: 3999bf7e3a408f15942779447e01dd7a
app_timezone: UTC
app_env: prod
messenger_transport: doctrine://default
mailer_dsn: null://null
```
