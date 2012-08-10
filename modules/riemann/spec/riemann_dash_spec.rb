require_relative 'spec_helper'

describe 'riemann::dash', :type => :class do
  it { should contain_package('riemann-dash')}
  it { should contain_service('riemann-dash').with_provider('upstart')}
end
