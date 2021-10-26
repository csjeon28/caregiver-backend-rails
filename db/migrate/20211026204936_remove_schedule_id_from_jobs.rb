class RemoveScheduleIdFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :schedule_id, :integer
  end
end
