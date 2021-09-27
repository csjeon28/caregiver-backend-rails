class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :date
      t.boolean :available

      t.timestamps
    end
  end
end
