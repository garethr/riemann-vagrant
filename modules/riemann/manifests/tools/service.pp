class riemann::tools::service($health_enabled=true, $net_enabled=true) {

  file { '/etc/init.d/riemann-health':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

  file { '/etc/init/riemann-health.conf':
    ensure  => present,
    source  => 'puppet:///modules/riemann/riemann-health.conf',
    notify  => Service['riemann-health'],
  }

  service {'riemann-health':
    ensure     => running,
    enable     => $health_enabled,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
    require    => [
      Class['riemann::tools::package'],
      File['/etc/init/riemann-health.conf'],
      File['/etc/init.d/riemann-health'],
    ]
  }

  file { '/etc/init.d/riemann-net':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

  file { '/etc/init/riemann-net.conf':
    ensure  => present,
    source  => 'puppet:///modules/riemann/riemann-net.conf',
    notify  => Service['riemann-net'],
  }

  service {'riemann-net':
    ensure     => running,
    enable     => $net_enabled,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
    require    => [
      Class['riemann::tools::package'],
      File['/etc/init/riemann-net.conf'],
      File['/etc/init.d/riemann-net'],
    ]
  }

}
