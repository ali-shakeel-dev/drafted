class ExperiencesController < ApplicationController
  before_action :set_resume

  def create
    @experience = @resume.experiences.build(experiences_params)
    if @experience.save
      redirect_to @resume
    else
      redirect_to @resume
    end
  end

  def update
    @experience = @resume.experiences.find(params[:id])
    if @experience.update(experiences_params)
      redirect_to resume_path(@resume)
    end    
  end

  def destroy
    @resume = current_user.resumes.find(params[:resume_id])

    @experience = @resume.experiences.find(params[:id]).destroy
    redirect_to @resume
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end

  def experiences_params
    params.require(:experience).permit(:company, :role, :start_date, :end_date, :description)
  end

end