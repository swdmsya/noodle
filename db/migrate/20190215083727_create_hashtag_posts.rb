class CreateHashtagPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_posts do |t|
      t.references :post, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
