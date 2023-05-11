class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @search_profiles = Profile.published.page(params[:page]).per(10)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params.require(:profile).permit(:name, :image, :call, :oshi_name, :reason, :every, :future, :job, :favorite_point, :free, :user_id, :user_name, :is_published_flag, :color, :sns))
    if @profile.save
      flash[:notice] = "登録が完了しました。"
      redirect_to @profile
    else
      flash[:notice] = "登録できませんでした。"
      render "new"
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
    
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(params.require(:profile).permit(:name, :image, :call, :oshi_name, :reason, :every, :future, :job, :favorite_point, :free, :user_id, :user_name, :is_published_flag, :color, :sns))
      flash[:notice] = "変更が完了しました！"
      redirect_to @profile
    else
      flash[:notice] = "変更できませんでした。"
      render "edit"
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:notice] = "削除されました"
    redirect_to :profiles
  end

  def myprofile_index
    @profiles = Profile.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end
  def likes
    likes = Like.where(user_id: current_user.id).pluck(:profile_id)
    @like_profiles = Profile.find(likes)
  end
end
