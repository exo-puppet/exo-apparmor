class apparmor::service {
    if ($apparmor::installed) {
        service { "apparmor":
            name    => $apparmor::params::service_name,
            ensure  => $apparmor::started ? {
                true    => running,
                default => stopped,
            },
            hasrestart  => true,
            hasstatus   => true,
            require => Class [ "apparmor::params","apparmor::config" ],
        }
    }
}