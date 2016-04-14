# == Class artifactory_consul::service
#
# This class is meant to be called from artifactory_consul.
# It ensure the service is running.
#
class artifactory_consul::service {

  service { $::artifactory_consul::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
