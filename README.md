<p align="center">
    <img alt="Argon Logo" src="/static/logo.png?v=1.0.1" height="150" />
    <h3 align="center">Argon</h3>
    <p align="center">Ansible Playbook to Deploy PHP Services.</p>
    <p align="center">
        <a href="https://github.com/ionsio/Argon/actions/workflows/build.yml">
            <img src="https://github.com/ionsio/Argon/actions/workflows/build.yml/badge.svg"/>
        </a>
    </p>
</p>
<br/>

## Usage

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
root_username: root
root_password: R2ZBmTR6nED6a71AxeTO2DSck
app_db_name: helium
app_db_username: admin
app_db_password: R2ZBmTR6nED6a71AxeTO2UIok
allow_access_from: "127.0.0.1"
```

5. Run ansible playbook to setup the server

```zsh
$ make prod
```

6. Create `helium.vault.yml` with these configs.

```zsh
$ ansible-vault create helium.vault.yml
```

```yaml
app_user: appmgmt
app_group: appmgmt

app_version: 0.3.0
git_repo: git@github.com:ionsio/Helium.git

workers_counts: 1

hostname: example.com

php_version: 8.1

app_db_name: helium
app_db_username: admin
app_db_password: R2ZBmTR6nED6a71AxeTO2UIok

app_secret: 3999bf7e3a408f15942779447e01dd7a
app_timezone: UTC
app_env: prod
messenger_transport: doctrine://default
mailer_dsn: null://null
```

7. Run ansible playbook to deploy `Helium` application.

```zsh
$ make helium
```


## Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, Argon is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/ionsio/argon/releases) for changelogs for each release version of Argon. It contains summaries of the most noteworthy changes made in each release. Also see the [Milestones section](https://github.com/ionsio/argon/milestones) for the future roadmap.


## Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/ionsio/argon/issues


## Security Issues

If you discover a security vulnerability within Argon, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


## Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


## License

© 2022, Argon. Released under [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

**Argon** is authored and maintained by [@Clivern](https://github.com/Clivern).
