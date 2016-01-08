class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :site_title, except: [:new] 

  def index
    if params[:category].blank?
      @projects = Project.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @projects = Project.where(category_id: @category_id).order("created_at DESC")
    end
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
    params.require(:project).permit(:title, :url, :image, :category_id)
  end
  
  def find_project
    @project = Project.find(params[:id])
  end
  
  def site_title
    @site_title = "FiFart Web Enthusiasts"
  end
  
end
