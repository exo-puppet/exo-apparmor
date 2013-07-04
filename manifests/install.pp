class apparmor::install {
  package { 'apparmor':
    ensure  => $apparmor::installed ? {
      true    => present,
      default => absent,
    },
    name    => $apparmor::params::package_name,
    require => [
      Exec['repo-update'],],
    notify  => Class['apparmor::config'],
  }
}
