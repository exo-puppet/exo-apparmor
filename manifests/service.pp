class apparmor::service {
  if ($apparmor::installed) {
    service { 'apparmor':
      ensure     => $apparmor::started ? {
        true    => running,
        default => stopped,
      },
      name       => $apparmor::params::service_name,
      hasrestart => true,
      hasstatus  => true,
      require    => Class['apparmor::params', 'apparmor::config'],
    }
  }
}
