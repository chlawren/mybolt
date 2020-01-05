plan demo5::getinfo (
    TargetSpec $targets,
    String      $host,

    ) {

  return run_task('demo5::getinfo', $targets, host => $targets)

}
