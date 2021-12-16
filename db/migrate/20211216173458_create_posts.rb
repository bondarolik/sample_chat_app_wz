class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :username
      t.integer :likes_count, default: 0
      t.integer :repost_count, default: 0

      t.timestamps
    end
  end
end
