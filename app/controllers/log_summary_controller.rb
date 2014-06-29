class LogSummaryController < ApplicationController
  def index
    @logs = MuscleGroupLog.all
  end

  def new
    @muscle_groups = MuscleGroup.all
    @log_summary = MuscleGroupLog.new
  end

  def create
    @log_summary = MuscleGroupLog.new(muscle_group_log_params)
      if @log_summary.save
            redirect_to '/'
      else
              redirect_to '/'

      end 
  end

  private
  def muscle_group_log_params
      params.require(:muscle_group_log).permit(:muscle_group_id, :date, :total_weight, :unit)
  end

end
