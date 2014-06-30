class AddUrlKeyToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :url_key, :string
  end
end
