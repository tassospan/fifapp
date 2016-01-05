class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

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
  end
  
  private
  
  def project_params
    params.require(:project).permit(:title, :url, :image)
  end
  
  def find_project
    @project = Project.find(params[:id])
  end
  
end
