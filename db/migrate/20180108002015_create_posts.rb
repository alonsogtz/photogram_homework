class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image
      t.string :caption
      t.integer :user_id

      t.timestamps

    end
  end
end
