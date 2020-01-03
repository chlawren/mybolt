# profile/plans/lamp/install_php.pp
plan profile::lamp::install_php (
  Targetspec $servers,
) {
  run_task('service', $servers, { name => 'httpd', action => 'stop' } )
  run_task('package', $servers, { name => 'php',   action => 'install' } )
  run_task('service', $servers, { name => 'httpd', action => 'start' } )
}
