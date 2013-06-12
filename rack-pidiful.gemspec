$:.push File.expand_path('../lib', __FILE__)

require 'rack/pidiful/version'

Gem::Specification.new do |s|
  s.name        = 'rack-pidiful'
  s.version     = Rack::Pidiful::VERSION
  s.authors     = ['Tate Johnson']
  s.email       = ['tate@thebestday.com']
  s.homepage    = 'http://github.com/thebestday/rack-pidiful'
  s.summary     = 'Log PID and Request ID'
  s.description = 'Log PID and Request ID'
  s.license     = 'MIT'

  s.files      = Dir['{lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rack', '>= 1.4.5'
end
