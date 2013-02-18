class puppet::basics{
  file{"/usr/local/bin/runpuppet":
    content => "sudo puppet apply --debug --verbose --summarize --reports store,riemann \
      --modulepath '/tmp/vagrant-puppet/modules-0' \
      /tmp/vagrant-puppet/manifests/site.pp --detailed-exitcodes",
    mode => 0755, owner => root, group => root
  }
  group{"puppet":
    ensure => present
  }
}


node default {
  include puppet::basics
  include riemann
  include riemann::dash::sample
  class { 'riemann::dash': config_file => '/etc/riemann-dash.rb' }
  include riemann::tools
}
