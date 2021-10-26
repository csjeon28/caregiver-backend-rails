class RemoveStateFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :state, :string
  end
end
