class mysql {

  yumrepo { 'percona':
    descr    => 'CentOS $releasever - Percona',
    baseurl  => 'http://repo.percona.com/percona/yum/release/$releasever/RPMS/$basearch',
    gpgkey   => 'https://repo.percona.com/yum/PERCONA-PACKAGING-KEY',
    enabled  => 1,
    gpgcheck => 1,
  }

  class { 'mysql::server':
    package_name     => 'Percona-Server-server-57',
    service_name     => 'mysql',
    config_file      => '/etc/my.cnf',
    includedir       => '/etc/my.cnf.d',
    root_password    => '@Demo12345!',
    override_options => {
      mysqld => {
        log-error => '/var/log/mysqld.log',
        pid-file  => '/var/run/mysqld/mysqld.pid',
      },
      mysqld_safe => {
        log-error => '/var/log/mysqld.log',
      },
    }
  }

  class {'mysql::client':
    package_name   => 'Percona-Server-client-57'
  }

  mysql::db { 'mydb':
    user     => 'myuser',
    password => 'mypass',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE'],
  }
}

include mysql

