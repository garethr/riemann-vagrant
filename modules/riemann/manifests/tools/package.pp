class riemann::tools::package {
  package { [
      'riemann-client',
      'riemann-tools',
    ]:
      ensure   => installed,
      provider => gem,
  }
}
