class CreateRelatedExercises < ActiveRecord::Migration
  def change
    create_table :related_exercises do |t|
      t.integer :product_id
      t.integer :exercise_id

      t.timestamps
    end
    
    add_index :related_exercises, :product_id
    add_index :related_exercises, :exercise_id
    add_index :related_exercises, [:product_id, :exercise_id], unique: true
  end
end
