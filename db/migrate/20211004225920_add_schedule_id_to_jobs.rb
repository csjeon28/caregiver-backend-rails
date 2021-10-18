class AddScheduleIdToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :schedule_id, :integer
  end
end
