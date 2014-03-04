# == Class: openssh::params
#
# Determines proper values for parameters based on operating system.
#
# === Examples
#
# Do not call directly.
#
class openssh::params {
  if $config_template == undef {
    case $::osfamily {
      redhat  : {
        $service_name    = 'sshd'
        $config_template = "${module_name}/redhat.sshd_config.erb"
        $config_file     = "/etc/ssh/sshd_config"
      }
      debian  : {
        $service_name    = 'ssh'
        $config_template = '${module_name}/debian.sshd_config.erb'
        $config_file     = "/etc/ssh/sshd_config"
      }
      default : {
        fail("Module ${module_name} is not supported on ${::osfamily}")
      }
    }
  }
  $port                    = '22'
  $permit_root_login       = 'no'
  $log_level               = 'INFO'
  $x11_forwarding          = 'no'
  $max_auth_tries          = '4'
  $password_authentication = 'yes'
  $restart_service         = true
  $ciphers                 = 'aes128-ctr,aes192-ctr,aes256-ctr'
  $client_alive_interval   = '300'
  $client_alive_count_max  = '0'
  $allow_users             = 'UNSET'
  $deny_users              = 'UNSET'
  $banner                  = '/etc/issue.net'
  $sftp_chroot             = false
  $service_ensure          = running
  $service_enable          = true
  $package_name            = 'openssh-server'
  $package_ensure          = 'present'
  $replace_config          = false
}
