class riemann::tools($health_enabled=true, $net_enabled=true) {
  include riemann::tools::package
  class { 'riemann::tools::service':
    health_enabled => $health_enabled,
    net_enabled    => $net_enabled,
  }
}
