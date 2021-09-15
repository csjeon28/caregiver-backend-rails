class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :city
      t.string :state
      t.text :job_description
      t.integer :number_of_children
      t.float :hourly_rate
      t.boolean :required_to_drive
      t.string :specific_days_needed
      t.integer :caregiver_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
