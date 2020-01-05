plan demo3::get_facts (
  TargetSpec $nodes
) {
  $res = run_task('facts', $nodes)
  notice($res)
  $first = $res.first
  $os = $first['os']
  notice($os)
}
