$:.push File.expand_path('../lib', __FILE__)

require 'rack/pidantic/version'

Gem::Specification.new do |s|
  s.name        = 'rack-pidantic'
  s.version     = Rack::Pidantic::VERSION
  s.authors     = ['Tate Johnson']
  s.email       = ['tate@thebestday.com']
  s.homepage    = 'http://github.com/thebestday/rack-pidantic'
  s.summary     = 'Log the PID and Request ID.'
  s.description = 'Log the PID and Request ID on each request to give visiblity into the history of a particular process (Eg: Unicorn worker)'
  s.license     = 'MIT'

  s.files      = Dir['{lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rack', '>= 1.4.5'
end
