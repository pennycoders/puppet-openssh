# == Class: openssh::params
#
# Determines proper values for parameters based on operating system.
#
# === Examples
#
# Do not call directly.
#
class openssh::params (
  $config_template) {
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
