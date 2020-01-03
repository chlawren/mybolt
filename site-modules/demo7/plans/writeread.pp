plan demo7::writeread (
  TargetSpec $targets,
  String     $filename,
  String     $content = 'Hello',
) {
  run_task(
    'demo7::write',
    $targets,
    filename => $filename,
    content  => $content,
  )
  return run_command("cat /tmp/${filename}", $targets)
}
