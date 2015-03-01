class CategoriesController < ApplicationController

	before_action :logged_in?
  before_action :get_category, :only => [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
  	@category = Category.new(project_params)
    if @category.save
      flash[:notice] = "#{@category.name}, was created."
    else
      flash[:error] = "Couldn't create #{@category.name}."
    end
  	redirect_to admin_path
  end

  def edit
  end

  def update
    if @category.update(project_params)
      flash[:notice] = "#{@category.name}, successfully updated."
      redirect_to admin_path
    else
      flash[:error] = "Couldn't update #{@category.name}. Try again."
      render 'edit'
    end
  end

  def destroy
  	if @category.destroy
      flash[:notice] = "#{@category.name}, successfully destroyed."
    else
      flash[:error] = "#{@category.name} couldn't get destroyed."
    end
      redirect_to admin_path
  end

  private
  	def project_params
  		params.require(:category).permit(:name)
  	end

    def get_category
      @category = Category.find(params[:id])
    end
end
