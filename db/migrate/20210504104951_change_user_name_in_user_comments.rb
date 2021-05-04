class ChangeUserNameInUserComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_comments, :postuserid, :user_id
    rename_column :user_comments, :senduserid, :receiver_id
  end
end
