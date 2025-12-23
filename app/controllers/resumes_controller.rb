class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resume, only: %i[show edit update destroy]

  def index 
    @resumes = current_user.resumes
  end

  def show

  end

  def new
    @resume = current_user.resumes.build
  end

  def create
    @resume = current_user.resumes.build(resumes_params)

    if @resume.save
      redirect_to @resume
    else
      render :new
    end
  end

  def edit
  end

  def update 
    if @resume.update(resumes_params)
      redirect_to @resume
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to resumes_path
  end

  private 

  def set_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resumes_params
    params.require(:resume).permit(:title, :template, :active)
  end
end

