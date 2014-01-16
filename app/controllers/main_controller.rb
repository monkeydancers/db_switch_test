class MainController < ApplicationController

  def index
    @actions = Action.limit(100)
    logger.info(@actions.count)
  end
end