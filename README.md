# Ansible role `collectd`

An Ansible role for installing `collectd` on RHEL/CentOS 7. Specifically, the responsibilities of this role are to:

- Install collectd, and, optionally, collectd-web
- Manage the configuration file

The following plugins are activated out-of-the-box:

- cpu
- interface
- load
- memory
- rrdtool

Activating other roles is currently out of the scope of this role. To do this yourself, place a configuration file into the folder `collectd_include_dir`. For more information on how to write a configuration file for collectd, see the [`collectd.conf(5)`](https://collectd.org/documentation/manpages/collectd.conf.5.shtml) man page.

## Requirements

No specific requirements

## Role Variables

This is a list of the configurable role variables. None of the variables are required.

| Variable                 | Default   | Comments (type)                                                                                |
| :---                     | :---      | :---                                                                                           |
| `collectd_fqdn_lookup`   | true      | Specifies whether the FQDN of the host should be determined automatically                      |
| `collectd_hostname`      | localhost | Host name                                                                                      |
| `collectd_interval`      | 10        | Sets the interval for collecting metrics, in seconds.                                          |
| `collectd_log_level`     | info      | Specifies the verbosity of logging. Values: info, notice, warning, err.                        |
| `collectd_read_threads`  | 5         | Number of threads to start for reading plugins.                                                |
| `collectd_timeout`       | 2         | Consider a value list "missing" when no update has been received for this number of iterations |
| `collectd_web_enabled`   | true      | Specifies whether `collectd-web` should be enabled.                                            |
| `collectd_write_threads` | 5         | Number of threads to start for dispatching value lists to write plugins.                       |

## Dependencies

No dependencies.

## Example Playbook

See the [test playbook](tests/test.yml)

## Testing

The `tests` directory contains tests for this role in the form of a Vagrant environment. The directory `tests/roles/collectd` is a symbolic link that should point to the root of this project in order to work. To create it, do

```ShellSession
$ cd tests/
$ mkdir roles
$ ln -frs ../../PROJECT_DIR roles/collectd
```

You may want to change the base box into one that you like. The current one is based on Box-Cutter's [CentOS Packer template](https://github.com/boxcutter/centos).

The playbook [`test.yml`](tests/test.yml) applies the role to a VM, setting role variables.

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section. Pull requests are also very welcome. Preferably, create a topic branch and when submitting, squash your commits into one (with a descriptive message).

## License

BSD

## Author Information

Bert Van Vreckem (bert.vanvreckem@gmail.com)

