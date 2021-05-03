class AddBlacklistToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :blacklist, :boolean, default: 'false'
  end
end
