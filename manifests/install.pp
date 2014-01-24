class apparmor::install {
  package { $apparmor::params::package_name:
    ensure  => $apparmor::installed ? {
      true    => present,
      default => absent,
    },
    require => [
      Exec['repo-update'],],
    notify  => Class['apparmor::config'],
  }
}
