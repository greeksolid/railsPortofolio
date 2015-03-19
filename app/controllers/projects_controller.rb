class ProjectsController < ApplicationController

  before_action :logged_in?, :except => [:index, :show]

  def index
    filter_projects
  end

  def new
    @project = Project.new
    @technologies = Technology.all.order(:name)
    @project_image = @project.project_images.build
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      upload_project_picture
      upload_images
    end

    redirect_to admin_path
  end

  def edit
    @project = Project.find(params[:id])
    @technologies = Technology.all.order(:name)
  end

  def update
    # set technogy_ids to an empty array if not set already
    params[:project][:technology_ids] ||= []

    @project = Project.find(params[:id])
    @project_picture = @project.project_picture.image.url

    if @project.update(project_params)
      # upload a new project picture
      upload_project_picture
      # upload any new images
      upload_images

      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_images = @project.project_images.all

    # get the id of the project's category
    category_id = @project.category_id
    # get that category
    @category = Category.find(category_id)

    # get the technologies names
    @technologies = @project.technologies.map(&:name)

    respond_to do |format|
      format.html
      format.js { render 'test' }
    end
  end

  def destroy
    @project = Project.find(params[:id])
    # Destroy the project and its picture
    @project.destroy

    redirect_to admin_path
  end
  
  private
    def project_params
      params.require(:project).permit(
        :title, 
        :description, 
        :category_id,
        {:project_picture => ['id', 'image']},
        {:project_images => ['id', 'image']},
        {:technology_ids => []}
      )
    end

    # upload project images
    def upload_images
      images = params[:project_images]
      if images
        images['image'].each do |image|
          @project_image = @project.project_images.create(:image => image, :project_id => @project.id)
        end
      end
    end

    # upload project picture
    def upload_project_picture
      ProjectPicture.create(:image => params[:project][:project_picture], :project_id => @project.id)
    end
    
end