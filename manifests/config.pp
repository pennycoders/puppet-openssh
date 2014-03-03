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
class openssh::config {
  anchor { 'openssh::config::start': } ->
  file { $openssh::config_file:
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    notify  => Service[$openssh::service_name],
    require => [Service[$openssh::service_name]],
    content => template($openssh::config_template)
  }
}
