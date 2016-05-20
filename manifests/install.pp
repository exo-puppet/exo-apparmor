class apparmor::install {
  ensure_packages ( $apparmor::params::package_name, {
    'ensure'  => $apparmor::installed ? {
      true    => present,
      default => absent,
    },
    'require' => Class['apt::update'],
    'notify'  => Class['apparmor::config'],
  })
}
