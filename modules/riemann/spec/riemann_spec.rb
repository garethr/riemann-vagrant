require_relative 'spec_helper'

describe 'riemann', :type => :class do
  it { should include_class('riemann::package') }
  it { should include_class('riemann::config') }
  it { should include_class('riemann::service') }
  it { should contain_file('/etc/riemann.config') }
  it { should contain_file('/etc/puppet/riemann.yaml') }
  it { should contain_package('wget')}
  it { should contain_service('riemann').with_provider('upstart')}
end
