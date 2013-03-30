include apt
include stdlib

class { 'ruby':
  gems_version => 'latest',
  stage        => setup,
}

include riemann
class { 'riemann::dash':
  host => '0.0.0.0',
}
include riemann::tools
