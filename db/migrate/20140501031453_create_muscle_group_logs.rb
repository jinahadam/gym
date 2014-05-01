class CreateMuscleGroupLogs < ActiveRecord::Migration
  def change
    create_table :muscle_group_logs do |t|
      t.integer :muscle_group_id
      t.date :date

      t.timestamps
    end
  end
end
