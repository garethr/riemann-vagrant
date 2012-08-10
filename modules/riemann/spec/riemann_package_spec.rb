require_relative 'spec_helper'

describe 'riemann::package', :type => :class do
  it { should contain_wget__fetch('download_riemann')}
  it { should contain_exec('untar_riemann').with_creates("/opt/riemann-0.1.2")}

  context 'a version specified' do
    let(:params) { {'version' => '1.0.0'} }
    it { should contain_wget__fetch('download_riemann').with_source("http://aphyr.com/riemann/riemann-1.0.0.tar.bz2")}
    it { should contain_exec('untar_riemann').with_creates("/opt/riemann-1.0.0")}
  end
end
