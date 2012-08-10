class riemann::dash::package {
  package { [
      'build-essential',
    ]:
      ensure => installed,
  }

  package { [
      'riemann-dash'
    ]:
      ensure   => installed,
      require  => Package['build-essential'],
      provider => gem,
  }
}
