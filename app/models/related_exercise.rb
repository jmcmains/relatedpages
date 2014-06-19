class RelatedExercise < ActiveRecord::Base
  belongs_to :product
  belongs_to :exercise
end
