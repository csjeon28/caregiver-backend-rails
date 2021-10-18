class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.integer :job_id
      t.integer :caregiver_id

      t.timestamps
    end
  end
end
