class riemann::package($version='0.1.2') {
  include wget

  package { [
      'leiningen',
      'clojure1.3',
    ]:
      ensure => installed,
  }

  wget::fetch { 'download_riemann':
    source      => "http://aphyr.com/riemann/riemann-$version.tar.bz2",
    destination => "/usr/local/src/riemann-$version.tar.bz2",
    before      => Exec['untar_riemann'],
  }

  exec { 'untar_riemann':
    command => "tar xvfj /usr/local/src/riemann-$version.tar.bz2",
    cwd     => '/opt',
    creates => "/opt/riemann-$version",
    path    => ['/bin',],
    before  => File['/opt/riemann'],
  }

  file { '/opt/riemann':
    ensure => link,
    target => "/opt/riemann-$version",
    notify => Service['riemann'],
  }

}
