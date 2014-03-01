# == Class: openssh::params
#
# Determines proper values for parameters based on operating system.
#
# === Examples
#
# Do not call directly.
#
class openssh::params (
  $port                    = 22,
  $permit_root_login       = 'yes',
  $log_level               = 'INFO',
  $x11_forwarding          = 'no',
  $max_auth_tries          = '5',
  $password_authentication = 'yes',
  $ciphers,
  $client_alive_interval,
  $client_alive_count_max,
  $allow_users,
  $deny_users,
  $banner) {
  case $::osfamily {
    redhat  : {
      $service_name    = 'sshd'
      $config_template = "${module_name}/redhat.sshd_config.erb"
    }
    debian  : {
      $service_name    = 'ssh'
      $config_template = '${module_name}/debian.sshd_config.erb'
    }
    default : {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }

}
