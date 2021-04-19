class AddBreweryIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :brewery_id, :integer
  end
end
