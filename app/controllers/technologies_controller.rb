class TechnologiesController < ApplicationController

  before_action :get_technology, :only => [:edit, :update, :destroy]

  def new
    @technology = Technology.new
  end

  def create
  	@technology = Technology.new(technology_params)

  	if @technology.save
  		flash[:notice] = 'Technology saved successfully'
  		redirect_to admin_path
  	else
  		flash[:notice] = 'Technology not saved. Try again.'
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @technology.update(technology_params)
  		flash[:notice] = "Category updated successfully."
  		redirect_to admin_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if @technology.destroy
  		flash[:notice] = "#{@technology.name} got deleted successfully."
  	else
  		flash[:notice] = "Couldn't delete #{@technology.name}."
  	end

  	redirect_to admin_path
  end

  private
  	def technology_params
  		params.require(:technology).permit(:name)
  	end

    def get_technology
      @technology = Technology.find(params[:id])
    end
    
end
