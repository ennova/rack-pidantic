require 'minitest/autorun'
require 'rack-pidiful'

class Rack::PidifulTest < MiniTest::Unit::TestCase
  def setup
    @out     = StringIO.new
    @app     = Proc.new { |env| env }
    @pidiful = Rack::Pidiful.new @app, out: @out
  end

  def output
    @out.string
  end

  def pidiful
    @pidiful
  end

  def test_call_logs_source
    env = {}

    pidiful.call env

    assert_includes output, 'source=rack-pidiful'
  end

  def test_call_logs_heroku_request_id
    env = {'HTTP_X_REQUEST_ID' => '2aa03f'}

    pidiful.call env

    assert_includes output, '2aa03f'
  end

  def test_call_logs_x_request_id
    env = {'HTTP_HEROKU_REQUEST_ID' => '55a1f3'}

    pidiful.call env

    assert_includes output, '55a1f3'
  end

  def test_call_logs_random_id
    env = {}

    pidiful.call env

    assert_includes output, 'rand-'
  end

  def test_call_logs_process_id
    env = {}

    pidiful.call env

    assert_includes output, Process.pid.to_s
  end
end
