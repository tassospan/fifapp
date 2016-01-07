class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :site_title

  def index
    @projects = Project.all.order("created_at DESC")
  end
  
  def show
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end
  
  def destroy
    @project.destroy
    redirect_to root_path, notice: "Succesfully Deleted"
  end
  
  private
  
  def project_params
    params.require(:project).permit(:title, :url, :image)
  end
  
  def find_project
    @project = Project.find(params[:id])
  end
  
  def site_title
    @sitetitle = "FiFart Web Enthusiasts"
  end
  
end
