plan profile::telegraf::deploy (
  TargetSpec $nodes,
  String[1]  $influxdb_hostname,
  String[1]  $influxdb_password,
) {
  # Install the puppet-agent package if Puppet is not detected.
  # Copy over custom facts from the Bolt modulepath.
  # Run the `facter` command line tool to gather node information.
  $nodes.apply_prep
  # Compile the manifest block into a catalog
  apply($nodes) {
    class { 'telegraf':
      hostname => $facts['networking']['fqdn'],
      logfile  => '/var/log/telegraf/telegraf.log',
      outputs  => {
      'influxdb' => {
          'urls'     => [ "http://${influxdb_hostname}:8086" ],
          'database' => 'telegraf',
          'username' => 'telegraf',
          'password' => $influxdb_password,
          },
      },
      inputs   => {
        'cpu'       => {
          'percpu'   => true,
          'totalcpu' => true,
        },
        'disk'      => {},
        'diskio'    => {},
        'mem'       => {},
        'net'       => {},
        'processes' => {},
        'syslog'    => {
          'server' => 'tcp://:6514',
        },
        'system'    => {},
      },
    }
  }
}
