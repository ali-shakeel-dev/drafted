class ProfilesController < ApplicationController
  before_action :set_resume
  def create 
    @profile = @resume.build_profile(profile_params)
    @profile.save
    redirect_to @resume
  end

  def update
    @profile = @resume.profile

    if @profile.update(profile_params)
      redirect_to @resume
    else
      render "resumes/show", status: :unprocessable_entity
    end
  end

  private

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :profession,
      :location,
      :email,
      :phone,
      :website,
      :description
    )
  end
end
