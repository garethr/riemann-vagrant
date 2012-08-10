require_relative 'spec_helper'

describe 'riemann::config', :type => :class do

  context 'with custom location settings' do
    let(:params) { {'riemann_server' => 'example.com', 'riemann_port' => 6000} }
    it { should contain_file('/etc/puppet/riemann.yaml').with_content(/example.com/)}
    it { should contain_file('/etc/puppet/riemann.yaml').with_content(/6000/)}
  end

  context 'without overriding the defaults' do
    it { should contain_file('/etc/puppet/riemann.yaml').with_content(/localhost/)}
    it { should contain_file('/etc/puppet/riemann.yaml').with_content(/5555/)}
  end
end
