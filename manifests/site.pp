include stdlib

case $::osfamily {
  'RedHat', 'Amazon': { $gem_version = '1.8.24' }
  default: { $gem_version = 'latest' }
}

case $::osfamily {
  'RedHat', 'Amazon': {
    service { 'iptables':
      ensure   => stopped,
      enable   => false,
      provider => redhat,
    }
  }
  default: {}
}

class { 'ruby':
  gems_version => $gem_version,
  stage        => runtime,
}

class { 'ruby::dev':
  stage        => runtime,
}

include riemann
class { 'riemann::dash':
  host  => '0.0.0.0',
  stage => setup_app,
}
class { 'riemann::tools':
  stage => setup_app,
}
