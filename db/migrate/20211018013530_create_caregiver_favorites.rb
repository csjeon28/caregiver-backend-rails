class CreateCaregiverFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :caregiver_favorites do |t|
      t.integer :caregiver_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
