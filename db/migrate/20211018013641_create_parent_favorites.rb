class CreateParentFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :parent_favorites do |t|
      t.integer :parent_id
      t.integer :caregiver_id

      t.timestamps
    end
  end
end
