class CreateRelatedProducts < ActiveRecord::Migration
  def change
    create_table :related_products do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
