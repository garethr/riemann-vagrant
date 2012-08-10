require 'rspec-puppet'

root_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..'))

RSpec.configure do |c|
  c.module_path = File.join(root_path, 'modules')
  c.manifest = File.join(root_path, 'manifests', 'blank.pp')
end
