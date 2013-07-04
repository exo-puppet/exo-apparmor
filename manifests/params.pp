class apparmor::params {
  case $::operatingsystem {
    /(Ubuntu)/ : {
      $package_name     = [
        'apparmor',
        'apparmor-utils']
      $service_name     = 'apparmor'
      $config_dir       = '/etc/apparmor.d'
      $config_dir_local = "${config_dir}/local"

    }
    default    : {
      fail("The ${module_name} module is not supported on ${::operatingsystem}")
    }
  }
}
