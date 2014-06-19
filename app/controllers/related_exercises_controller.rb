class RelatedExercisesController < ApplicationController

 
  def create
    @exercise = Exercise.find(params[:related_exercise][:exercise_id])
    @product = Product.find(params[:related_exercise][:product_id])
    @product.relate!(@exercise)
    respond_to do |format|
      format.html {redirect_to request.referer}
      format.js
    end
  end

  def destroy
    @exercise = RelatedExercise.find(params[:id]).exercise
    @product = RelatedExercise.find(params[:id]).product
    @product.unrelate!(@exercise)
    respond_to do |format|
      format.html {redirect_to request.referer}
      format.js
    end
  end
  

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:follower_id,:followed_id)
    end
end
