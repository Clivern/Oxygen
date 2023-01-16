<p align="center">
    <img alt="Oxygen Logo" src="/static/logo.png?v=1.0.1" height="150" />
    <h3 align="center">Oxygen</h3>
    <p align="center">Ansible Playbook to Deploy PHP Services.</p>
    <p align="center">
        <a href="https://github.com/Colvern/Oxygen/actions/workflows/build.yml">
            <img src="https://github.com/Colvern/Oxygen/actions/workflows/build.yml/badge.svg"/>
        </a>
    </p>
</p>
<br/>

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


### Deploy Helium Application

1. Create `helium.vault.yml` with these configs.

```zsh
$ ansible-vault create helium.vault.yml
```

```yaml
app_user: appmgmt
app_group: appmgmt

app_version: 1.0.0
git_repo: git@github.com:Colvern/Helium.git

workers_counts: 1

hostname: helium.com

php_version: 8.1

app_db_name: helium
app_db_username: admin
app_db_password: R2ZBmTR6nED6a71AxeTO2UIok

app_secret: 3999bf7e3a408f15942779447e01dd7a
app_timezone: UTC
app_env: prod
messenger_transport: doctrine://default
mailer_dsn: sendmail://default
```

2. Run ansible playbook to deploy `Helium` application.

```zsh
$ make helium
```


### Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, Oxygen is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/colvern/oxygen/releases) for changelogs for each release version of Oxygen. It contains summaries of the most noteworthy changes made in each release. Also see the [Milestones section](https://github.com/colvern/oxygen/milestones) for the future roadmap.


### Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/colvern/oxygen/issues


### Security Issues

If you discover a security vulnerability within Oxygen, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


### Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


### License

© 2022, Oxygen. Released under [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

**Oxygen** is authored and maintained by [@Clivern](https://github.com/Clivern).
