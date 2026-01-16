class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resume, only: %i[show edit update destroy download]

  def index 
    @resumes = current_user.resumes.order(created_at: :desc)
  end

  def show
    @resume = Resume.find(params[:id])
    @profile = @resume.profile || @resume.build_profile
    @experience = 
    if params[:edit_experience_id]
      @resume.experiences.find(params[:edit_experience_id])
    else
      Experience.new(resume: @resume)
    end

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

  def download
    respond_to do |format|
      format.pdf do
        render pdf: @resume.title.parameterize, 
              template: "resumes/pdf",
              formats: [:html],
              layout: "pdf",
              disposition: "attachment"
      end
    end
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resumes_params
    params.require(:resume).permit(:title, :template, :active)
  end
end

