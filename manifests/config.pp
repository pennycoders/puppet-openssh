# == Class: openssh::config
#
# Configures the openssh config file.
#
# === Parameters
#
# See top openssh class for details.
#
# === Examples
#
# Do not call directly.
#
class openssh::config inherits openssh::params {
  file { $config_file:
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    content => template($config_template),
    notify  => Service[$service_name]
  }
}
