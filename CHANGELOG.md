## v1.2.2:

* [COOK-2297] - more gracefully handle pip packages from VCS and
  source archives

## v1.2.0:

* [COOK-1866] - /usr/bin is not a pip binary location in source
  installs on RHEL
* [COOK-1925] - add smartos support

## v1.1.0:

* [COOK-1715] - Add user and group to python_pip
* [COOK-1727] - Python cookbook cannot install `pip` on CentOS
  versions < 6

## v1.0.8:

* [COOK-1016] - python package needs separate names for centos/rhel 5.x vs 6.x
* [COOK-1048] - installation of pip does not honor selected python version
* [COOK-1282] - catch Chef::Exceptions::ShellCommandFailed for chef 0.10.8 compatibility
* [COOK-1311] - virtualenv should have options attribute
* [COOK-1320] - pip provider doesn't catch correct exception
* [COOK-1415] - use plain 'python' binary instead of versioned one for
  default interpreter

## v1.0.6:

* [COOK-1036] - correctly grep for python-module version
* [COOK-1046] - run pip inside the virtualenv

## v1.0.4:

* [COOK-960] - add timeout to python_pip
* [COOK-651] - 'install_path' not correctly resolved when using python::source
* [COOK-650] - Add ability to specify version when installing distribute.
* [COOK-553] - FreeBSD support in the python cookbook
