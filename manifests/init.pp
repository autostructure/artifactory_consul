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
class artifactory_consul {

  # validate parameters here

  # class { '::artifactory_consul::install': } ->
  class { '::artifactory_consul::config': } ->
  #class { '::artifactory::service': } ->
  Class['::artifactory_consul']
}
