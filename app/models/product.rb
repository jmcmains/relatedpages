class Product < ActiveRecord::Base
  has_many :related_exercises, dependent: :destroy
  has_many :exercises, through: :related_exercises, source: :exercise
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :related_products, through: :relationships, source: :followed

  def related?(element)
    if element.class == Product.first.class
      relationships.find_by(followed_id: element.id)
    elsif element.class == Exercise.first.class
      related_exercises.find_by(exercise_id: element.id)
    end
  end
  
  def reverse_relationship(product)
    product.relationships.find_by(followed_id: id)
  end
  
  def relate!(element)
    if element.class == Product.first.class
      relationships.create!(followed_id: element.id)
      element.relationships.create!(followed_id: id)
    elsif element.class == Exercise.first.class
      related_exercises.create!(exercise_id: element.id)
    end
  end
  
  def unrelate!(element)
    if element.class == Product.first.class
      relationships.find_by(followed_id: element.id).destroy
      element.relationships.find_by(followed_id: id).destroy
    elsif element.class == Exercise.first.class
      related_exercises.find_by(exercise_id: element.id).destroy
    end
  end
  
  def next_product
    Product.where("name > ?",name).order("name ASC").first
  end

  def previous_product
    Product.where("name < ?",name).order("name DESC").first
  end
end
