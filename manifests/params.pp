# == Class artifactory_consul::params
#
# This class is meant to be called from artifactory_consul.
# It sets variables according to platform.
#
class artifactory_consul::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'artifactory_consul'
      $service_name = 'artifactory_consul'
    }
    'RedHat', 'Amazon': {
      $package_name = 'artifactory_consul'
      $service_name = 'artifactory_consul'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
