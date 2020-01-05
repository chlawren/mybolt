plan demo5::sysinfo (
    TargetSpec $targets,
    String      $host,

    ) {

  return run_task('demo5::getinfo', $targets, host => $targets)

}
