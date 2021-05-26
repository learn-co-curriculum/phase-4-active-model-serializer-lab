class ProfilesController < ApplicationController
  def index
    profiles = Profile.all
    render json: profiles
  end

  def show
    profile = Profile.find_by(id: params[:id])
    if profile
      render json: profile, status: :found 
    else 
      render json: {errors: "Profile not found"}
    end
  end

end
