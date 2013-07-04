################################################################################
# TODO documentation on apparmor::define
################################################################################
define apparmor::define (
  $main_content  = false,
  $local_content = false) {
  if ($main_content != false) {
    file { "apparmor-main-${name}":
      ensure  => present,
      path    => "${apparmor::params::config_dir}/${name}",
      owner   => root,
      group   => root,
      mode    => 0644,
      content => $main_content,
      require => Class['apparmor::config'],
      notify  => Class['apparmor::service'],
    }
  }

  if ($local_content != false) {
    file { "apparmor-local-${name}":
      ensure  => present,
      path    => "${apparmor::params::config_dir_local}/${name}",
      owner   => root,
      group   => root,
      mode    => 0644,
      content => $local_content,
      require => Class['apparmor::config'],
      notify  => Class['apparmor::service'],
    }
  }
}
