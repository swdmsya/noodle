class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text    :impressions
      t.integer :genre_id,  default: 10
      t.integer :user_id
      t.timestamps
    end
    add_index :posts, :genre_id
    add_index :posts, :user_id
  end
end
