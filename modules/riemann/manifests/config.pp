class riemann::config($riemann_server='localhost', $riemann_port='5555') {
  file { '/etc/riemann.config':
    ensure  => present,
    source  => 'puppet:///modules/riemann/riemann.config',
  }

  file { '/etc/puppet/riemann.yaml':
    ensure  => present,
    content => template('riemann/puppet/riemann.yaml.erb')
  }
}
