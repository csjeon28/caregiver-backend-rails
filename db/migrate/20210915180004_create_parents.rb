class CreateParents < ActiveRecord::Migration[6.1]
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.string :city
      t.string :state
      t.string :country
      t.string :language
      t.boolean :smoker
      t.boolean :has_pets
      t.float :hourly_rate
      t.string :profile_image
      t.integer :number_of_children

      t.timestamps
    end
  end
end
