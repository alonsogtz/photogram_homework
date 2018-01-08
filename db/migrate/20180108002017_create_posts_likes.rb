class CreatePostsLikes < ActiveRecord::Migration
  def change
    create_table :posts_likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps

    end
  end
end
