class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def create
  	@project = Project.new(project_params)
  	@project.save

  	redirect_to @project
  end

  def new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
  	@project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(params[:project].permit(:title, :description))
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.delete

    redirect_to projects_path
  end

  private
  	def project_params
  		params.require(:project).permit(:title, :description)
  	end
end

