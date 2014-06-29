class MuscleGroupLog < ActiveRecord::Base
  belongs_to :muscle_group

  validates_presence_of :muscle_group_id

  attr_accessor :muscle_group_name

  def muscle_group_name
    self.muscle_group.name
  end

  def self.days_since
    result = Hash.new
    MuscleGroup.all.each do |group|
      name = group.name
      logs_for_group_count = MuscleGroupLog.where(muscle_group_id:group.id).count
      if logs_for_group_count > 0
        dates = MuscleGroupLog.where(muscle_group_id:group.id).pluck(:date)
        result[name] = (Date.today - dates.max).to_i
      end
    end
    puts Hirb::Helpers::AutoTable.render(result.sort_by {|k,v| v}.reverse)
  end

  def self.create_log(d, group, weight, u)
    g = MuscleGroup.where(name:group).first.id
    MuscleGroupLog.create(date:d, muscle_group_id:g, total_weight:weight, unit:u)
  end



end
