Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
File { owner => 0, group => 0, mode => 0644 }
stage { 'first': }
stage { 'last': }
Stage['first'] -> Stage['main'] -> Stage['last']


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

  -> exec{"update apt-get":
    command => "apt-get update && touch /var/tmp/.apt-get-updated",
    unless  => "test -e /var/tmp/.apt-get-updated"
  }
}


node default {
  class{"puppet::basics": stage => 'first'}
  -> class{"riemann":}
  -> class{"riemann::dash::sample":}
  -> class { 'riemann::dash': config_file => '/etc/riemann-dash.rb' }
  -> class { 'riemann::tools': }
}
