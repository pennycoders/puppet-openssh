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
    replace => $openssh::replace_config,
    group   => 'root',
    content => template($openssh::config_template)
  } ->
  anchor { 'openssh::config::end': }
}
