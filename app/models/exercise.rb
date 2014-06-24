class Exercise < ActiveRecord::Base
  has_many :related_exercises, foreign_key: "exercise_id", dependent: :destroy
  has_many :products, through: :related_exercises, source: :product
  
  def related?(product)
    related_exercises.find_by(product_id: product.id)
  end

  def relate!(product)
    related_exercises.create!(product_id: product.id)
  end
  
  def unrelate!(product)
    related_exercises.find_by(product_id: user.id).destroy
  end
  
  def next_exercise
    Exercise.where("name > ?",name).order("name ASC").first
  end

  def previous_exercise
    Exercise.where("name < ?",name).order("name DESC").first
  end
end
