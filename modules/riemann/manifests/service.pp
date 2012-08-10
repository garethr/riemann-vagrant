class riemann::service {
  file { '/etc/init.d/riemann':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

  file { '/etc/init/riemann.conf':
    ensure  => present,
    source  => 'puppet:///modules/riemann/riemann.conf',
  }

  service {'riemann':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
    require    => [
      File['/etc/init.d/riemann'],
      File['/etc/init/riemann.conf'],
      Class['riemann::package'],
    ],
  }

  File['/etc/riemann.config'] ~> Service['riemann']
  File['/etc/init/riemann.conf'] ~> Service['riemann']
}
