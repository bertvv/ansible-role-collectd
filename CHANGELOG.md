# Change log

This file contains al notable changes to the collectd Ansible role.

This file adheres to the guidelines of [http://keepachangelog.com/](http://keepachangelog.com/). Versioning follows [Semantic Versioning](http://semver.org/).

## 3.1.0 - 2021-04-13

### Added

- Support for the [Apache plugin](https://collectd.org/wiki/index.php/Plugin:Apache)
- Support for the [DBI plugin](https://collectd.org/wiki/index.php/Plugin:DBI)
- Test framework based on Molecule and Vagrant

### Changed

- Network traffic between nodes is now encrypted. Be sure to change the default password in variable `collectd_password`!
- Fixed deprecation and linter warnings

## 3.0.1 - 2017-11-21

### Changed

- Fixed Ansible 2.4 deprecation warnings (include: -> include_tasks:)

## 3.0.0 - 2016-10-26

### Changed

- Made compatible with Ansible 2.0, removed deprecation warnings.
- Made compatible with CentOS 7.2.

## 2.0.0 - 2015-05-15

### Added

- Client/server setup. The variable `collectd_server` specifies the IP of the collectd server. If a hosts's IP address matches `collectd_server`, it will be set up as a server, otherwise as a client that sends its information to the server.

### Changed

- Fixed a bug where packages for collectd-web are not installed
- Reorganised task playbooks

### Removed

- Variable `collectd_hostname` and `collectd_fqdn_lookup` were removed. FQDN lookup is the recommended setting and is adopted here. This is not backwards compatible: if you specified `collectd_fqdn_lookup: false` in your playbook, it will not behave as expected!

## 1.0.0 - 2015-05-14

First release!

### Added

- Install collectd and, optionally, collectd-web

