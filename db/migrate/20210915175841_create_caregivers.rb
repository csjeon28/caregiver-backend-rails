class CreateCaregivers < ActiveRecord::Migration[6.1]
  def change
    create_table :caregivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.date :date_of_birth
      t.text :bio
      t.boolean :smoker
      t.string :city
      t.string :state
      t.string :country
      t.string :language
      t.float :hourly_rate
      t.boolean :ability_to_drive
      t.boolean :first_aid_cert
      t.boolean :CPR_cert
      t.string :profile_image

      t.timestamps
    end
  end
end
