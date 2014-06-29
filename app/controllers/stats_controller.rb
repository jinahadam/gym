class StatsController < ApplicationController
  def index
    @days_since = MuscleGroupLog.days_since
  end
end
