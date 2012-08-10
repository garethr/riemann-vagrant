node default {
  include riemann
  include riemann::dash
  class { 'riemann::tools': health_enabled => true }
}
