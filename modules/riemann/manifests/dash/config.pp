class riemann::dash::config {
  file { '/etc/riemann-dash.rb':
    ensure  => present,
    source  => 'puppet:///modules/riemann/riemann-dash.rb',
    notify  => Service['riemann-dash'],
  }

  file { '/usr/share/riemann-dash':
    ensure  => directory,
    recurse => true,
    source  => 'puppet:///modules/riemann/riemann-dash',
    notify  => Service['riemann-dash'],
  }
}
