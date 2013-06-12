require 'logger'
require 'securerandom'

require 'rack/pidantic/version'

module Rack
  class Pidantic
    def initialize app, options = {}
      @app = app
      @out = options.fetch :out, $stdout
    end

    def call env
      request_id = env['HTTP_HEROKU_REQUEST_ID'] || env['HTTP_X_REQUEST_ID'] || "rand-#{SecureRandom.hex}"
      process_id = Process.pid

      logger.info "source=rack-pidantic request_id=#{request_id} process_id=#{process_id}"

      app.call env
    end

  private

    def app
      @app
    end

    attr_reader :app
    attr_reader :out

    def logger
      @logger ||= ::Logger.new out
    end
  end
end
