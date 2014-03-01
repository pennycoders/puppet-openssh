# == Class: openssh::params
#
# Determines proper values for parameters based on operating system.
#
# === Examples
#
# Do not call directly.
#
class openssh::params (
  $port                    = $openssh::port,
  $permit_root_login       = $openssh::permit_root_login,
  $log_level               = $openssh::log_level,
  $x11_forwarding          = $openssh::x11_forwarding,
  $max_auth_tries          = $openssh::max_auth_tries,
  $password_authentication = $openssh::password_authentication,
  $ciphers                 = $openssh::ciphers,
  $client_alive_interval   = $openssh::client_alive_interval,
  $client_alive_count_max  = $openssh::client_alive_count_max,
  $allow_users             = $openssh::allow_users,
  $deny_users              = $openssh::deny_users,
  $banner                  = $openssh::banner,
  $sftp_chroot             = $openssh::sftp_chroot,
  $service_ensure          = $openssh::service_ensure,
  $service_enable          = $openssh::service_enable,
  $package_name            = $openssh::package_name,
  $package_ensure          = $openssh::package_ensure,
  $config_template         = $openssh::config_template) {
  if $config_template == undef {
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
}
