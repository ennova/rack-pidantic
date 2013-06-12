require 'minitest/autorun'
require 'rack-pidantic'

class Rack::PidanticTest < MiniTest::Unit::TestCase
  def setup
    @out      = StringIO.new
    @app      = Proc.new { |env| env }
    @pidantic = Rack::Pidantic.new @app, out: @out
  end

  def output
    @out.string
  end

  def pidantic
    @pidantic
  end

  def test_call_logs_source
    env = {}

    pidantic.call env

    assert_includes output, 'source=rack-pidantic'
  end

  def test_call_logs_heroku_request_id
    env = {'HTTP_X_REQUEST_ID' => '2aa03f'}

    pidantic.call env

    assert_includes output, '2aa03f'
  end

  def test_call_logs_x_request_id
    env = {'HTTP_HEROKU_REQUEST_ID' => '55a1f3'}

    pidantic.call env

    assert_includes output, '55a1f3'
  end

  def test_call_logs_random_id
    env = {}

    pidantic.call env

    assert_includes output, 'rand-'
  end

  def test_call_logs_process_id
    env = {}

    pidantic.call env

    assert_includes output, Process.pid.to_s
  end
end
