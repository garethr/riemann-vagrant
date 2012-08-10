require 'puppet'
require 'yaml'

begin
  require 'riemann/client'
rescue LoadError => e
  Puppet.info "You need the `riemann-client` gem to use the Riemann report"
end

Puppet::Reports.register_report(:riemann) do

  configfile = File.join([File.dirname(Puppet.settings[:config]), "riemann.yaml"])
  raise(Puppet::ParseError, "Riemann report config file #{configfile} not readable") unless File.exist?(configfile)
  config = YAML.load_file(configfile)
  RIEMANN_SERVER = config[:riemann_server] ||= 'localhost'
  RIEMANN_PORT = config[:riemann_port] ||= 5555

  desc <<-DESC
  Send metrics to Riemann.
  DESC

  def process
    Puppet.debug "Sending metrics for #{self.host} to Riemann server at #{RIEMANN_SERVER}"
    @client = Riemann::Client.new(:host => "#{RIEMANN_SERVER}", :port => RIEMANN_PORT)
    if self.status == 'failed'
      state = 'critical'
    else
      state = 'ok'
    end
    event = {
        :host => self.host,
        :service => "puppet",
        :state => state,
        :description => "Puppet run for #{self.host} #{self.status} at #{Time.now.asctime}",
        :tags => ["puppet"]
      }
      @client << event
      self.metrics.each { |metric,data|
        data.values.each { |val|
          name = "Puppet #{val[1]} #{metric}"
          if metric == 'time'
            units = 'seconds'
          else
            units = metric
          end
          value = val[2]
          event = {
            :host    => self.host,
            :service => name,
            :metric  => value,
            :state   => 'ok', 
            :tags    => ["puppet"]
          }
          @client << event
        }
      }
  end
end
