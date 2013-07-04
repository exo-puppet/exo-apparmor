class apparmor (
  $installed = true,
  $started   = true) {
  include apparmor::params, apparmor::install, apparmor::config, apparmor::service
}
