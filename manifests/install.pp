class apparmor::install {
	
    package {"apparmor":
        ensure      => present, 
        name        => $apparmor::params::package_name,
        require     => [ Exec ["repo-update"], ],
        notify      => Class [ "apparmor::config" ],
    }
}
