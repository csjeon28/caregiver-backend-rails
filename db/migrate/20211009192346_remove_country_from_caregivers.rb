class RemoveCountryFromCaregivers < ActiveRecord::Migration[6.1]
  def change
    remove_column :caregivers, :country, :string
  end
end
