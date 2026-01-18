class ProjectsController < ApplicationController  
  before_action :set_resume

  def create
    @project = @resume.projects.build(projects_params)
    if @project.save
      redirect_to resume_path(@resume)
    end
  end

  def update
    project = @resume.projects.find(params[:id])
    project.update(projects_params)
    redirect_to resume_path(@resume)
  end
  
  def destroy
    @resume.projects.find(params[:id]).destroy
    redirect_to resume_path(@resume)    
  end

  private 

  def projects_params
    params.require(:project).permit(:name, :description, :link)
  end

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end
end
