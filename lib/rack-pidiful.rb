require 'rack/pidiful'

if defined?(Rails) && [3,4].include?(Rails::VERSION::MAJOR)
  class Rack::Pidiful::Railtie < Rails::Railtie
    initializer 'rack-pidiful.middleware', after: 'rack-timeout.prepend' do |app|
      if defined? Rack::Timeout
        app.config.middleware.insert_after Rack::Timeout, Rack::Pidiful
      else
        app.config.middleware.insert_after ActionDispatch::RequestId, Rack::Pidiful
      end
    end
  end
end
