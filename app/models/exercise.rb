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
end
