class SkillsController < ApplicationController
  before_action :set_resume
  def create
    @resume.skills.create(skills_params)
    redirect_to @resume
  end

  def destroy
    skill = current_user.resumes.find(params[:resume_id]).skills.find(params[:id])

    if skill.destroy
      redirect_to @resume
    else
      redirect_to resumes_path
    end
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end

  def skills_params
    params.require(:skill).permit(:name)
  end
end
