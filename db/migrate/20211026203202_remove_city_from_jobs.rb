class RemoveCityFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :city, :string
  end
end
