# Class: artifactory_consul
# ===========================
#
# Full description of class artifactory_consul here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class artifactory_consul (
  $package_name = $::artifactory_consul::params::package_name,
  $service_name = $::artifactory_consul::params::service_name,
) inherits ::artifactory_consul::params {

  # validate parameters here

  class { '::artifactory_consul::install': } ->
  class { '::artifactory_consul::config': } ~>
  class { '::artifactory_consul::service': } ->
  Class['::artifactory_consul']
}
