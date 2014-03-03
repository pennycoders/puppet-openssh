# == Class: openssh::service
#
# Manages the openssh service.
#
# === Parameters
#
# See top openssh class for details.
#
# === Examples
#
# Do not call directly.
#
class openssh::service inherits openssh::params {
  if $restart_service == true {
    $subscribe = File[$config_file]
  } else {
    $subscribe = undef
  }

  service { $service_name:
    ensure    => $service_ensure,
    enable    => $service_enable,
    require   => [Class['openssh::install']],
    subscribe => $subscribe
  }
}
