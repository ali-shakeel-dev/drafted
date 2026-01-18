class EducationsController < ApplicationController
  before_action :set_resume
  
  def create
    @education = @resume.educations.build(education_params)
    if @education.save
      redirect_to @resume
    else
      redirect_to @resume
    end
  end

  def update
    education = @resume.educations.find(params[:id])
    if education.update(education_params)
      redirect_to resume_path(@resume)
    else 
      redirect_to resume_path(@resume)
    end
  end

  def destroy
    @education = @resume.educations.find(params[:id]).destroy
    redirect_to resume_path(@resume)
  end

  private

  def education_params
    params.require(:education).permit(:institution, :degree, :start_date, :end_date, :description)
  end

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end

end