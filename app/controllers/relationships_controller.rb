class RelationshipsController < ApplicationController

 
  def create
    @follower = Product.find(params[:relationship][:follower_id])
    @followed = Product.find(params[:relationship][:followed_id])
    @followed.relate!(@follower)
    respond_to do |format|
      format.html {redirect_to request.referer}
      format.js
    end
  end

  def destroy
    @follower = Relationship.find(params[:id]).follower
    @followed = Relationship.find(params[:id]).followed
    @followed.unrelate!(@follower)
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
