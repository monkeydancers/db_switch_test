class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :establish_db_connection
  
  private
  
  def establish_db_connection
    if rand(2) > 0
      env = "staging"
    else
      env = "production"
    end
    logger.info("Using env: " + env)
    timing = Benchmark.measure("Establish connection") do
      spec = ActiveRecord::Base.configurations[env]
      ActiveRecord::Base.establish_connection(spec)
    end

    logger.info(timing.format("%n: %t %u %y %r"))
  end
end
