class RemoveCountryFromParents < ActiveRecord::Migration[6.1]
  def change
    remove_column :parents, :country, :string
  end
end
