# This file was automatically generated on 2020-01-05 10:15:51 +0000.
# Use the 'puppet generate types' command to regenerate this file.

# Manage Apache 2 modules
Puppet::Resource::ResourceType3.new(
  'a2mod',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # The name of the module to be managed
    Puppet::Resource::Param(Any, 'name', true),

    # The name of the .so library to be loaded
    Puppet::Resource::Param(Any, 'lib'),

    # Module identifier string used by LoadModule. Default: module-name_module
    Puppet::Resource::Param(Any, 'identifier'),

    # The specific backend to use for this `a2mod`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # a2mod
    # : Manage Apache 2 modules on Debian and Ubuntu
    # 
    #   * Required binaries: `a2dismod`, `a2enmod`, `apache2ctl`.
    #   * Default for `operatingsystem` == `debian, ubuntu`.
    # 
    # gentoo
    # : Manage Apache 2 modules on Gentoo
    # 
    #   * Default for `operatingsystem` == `gentoo`.
    # 
    # modfix
    # : Dummy provider for A2mod.
    #   Fake nil resources when there is no crontab binary available. Allows
    #   puppetd to run on a bootstrapped machine before a Cron package has been
    #   installed. Workaround for: http://projects.puppetlabs.com/issues/2384
    # 
    # redhat
    # : Manage Apache 2 modules on RedHat family OSs
    # 
    #   * Required binaries: `apachectl`.
    #   * Default for `osfamily` == `redhat`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
