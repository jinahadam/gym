class AddUnitToMuscleGroupLog < ActiveRecord::Migration
  def change
    add_column :muscle_group_logs, :unit, :string
  end
end
