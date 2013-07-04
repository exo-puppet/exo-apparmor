class apparmor::config {
  file { 'apparmor-config-dir':
    ensure  => directory,
    path    => $apparmor::params::config_dir,
    owner   => root,
    group   => root,
    mode    => 0755,
    require => Class['apparmor::install'],
    notify  => Class['apparmor::service'],
  }

  file { 'apparmor-config-dir-local':
    ensure  => directory,
    path    => $apparmor::params::config_dir_local,
    owner   => root,
    group   => root,
    mode    => 0755,
    require => File['apparmor-config-dir'],
    notify  => Class['apparmor::service'],
  }
}
