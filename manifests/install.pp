# == Class artifactory_consul::install
#
# This class is called from artifactory_consul for install.
#
class artifactory_consul::install {
  file { "${::artifactory::plugins_dir}/consul.groovy":
    source => 'puppet:///modules/artifactory_consul/consul.groovy',
    notify => Service['artifactory'],
  }
}
