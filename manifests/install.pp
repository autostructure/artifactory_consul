# == Class artifactory_consul::install
#
# This class is called from artifactory_consul for install.
#
class artifactory_consul::install {

  package { $::artifactory_consul::package_name:
    ensure => present,
  }
}
