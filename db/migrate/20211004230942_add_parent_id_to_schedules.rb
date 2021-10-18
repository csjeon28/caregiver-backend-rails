class AddParentIdToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :parent_id, :integer
  end
end
