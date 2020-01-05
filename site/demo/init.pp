class myexec {

  exec { 'uptime':
    command => 'uptime',
    path    => '/usr/local/bin/:/bin/',
  }
}

include myexec
