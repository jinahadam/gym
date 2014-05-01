class AddTotalWeightToMuscleGroupLog < ActiveRecord::Migration
  def change
    add_column :muscle_group_logs, :total_weight, :float
  end
end
