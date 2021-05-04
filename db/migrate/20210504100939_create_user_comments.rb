class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.integer :postuserid
      t.integer :senduserid
      t.string :body

      t.timestamps
    end
  end
end
