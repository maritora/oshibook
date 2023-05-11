class LikesController < ApplicationController
    before_action :profile_params
    def create
      Like.create(user_id: current_user.id, profile_id: params[:id])
    end
    
    def destroy
      Like.find_by(user_id: current_user.id, profile_id: params[:id]).destroy
    end
    
    private
    
    def profile_params
      @profile = Profile.find(params[:id])
    end
end
