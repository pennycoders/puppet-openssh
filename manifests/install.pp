# == Class: openssh::install
#
# Installs the opensshd package.
#
# === Parameters
#
# See top openssh class for details.
#
# === Examples
#
# Do not call directly.
#
class openssh::install inherits openssh::params {
  anchor { 'openssh::install::start': } ->
  package { $package_name: ensure => $package_ensure } ->
  anchor { 'openssh::install::end': }
}
