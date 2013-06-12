require 'rack/pidantic'

if defined?(Rails) && [3,4].include?(Rails::VERSION::MAJOR)
  class Rack::Pidantic::Railtie < Rails::Railtie
    initializer 'rack-pidantic.middleware', after: 'rack-timeout.prepend' do |app|
      if defined? Rack::Timeout
        app.config.middleware.insert_after Rack::Timeout, Rack::Pidantic
      else
        app.config.middleware.insert_after ActionDispatch::RequestId, Rack::Pidantic
      end
    end
  end
end
