require_relative 'config/environment'

class LowLevelTester
  def initialize(app)
    @app = app
  end

  def call(env)
    raise "low level error"

    @app.call(env)
  end
end

use LowLevelTester
run Rails.application
