# == Class artifactory_consul::config
#
# This class is called from artifactory_consul for service config.
#
class artifactory_consul::config {
  file { "${::artifactory::plugins_dir}/consul.groovy":
    source => 'puppet:///modules/artifactory_consul/consul.groovy',
  }
}
