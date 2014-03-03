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
  package { $package_name: ensure => $openssh::package_ensure }
}
