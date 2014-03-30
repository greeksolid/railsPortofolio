class ProjectsController < ApplicationController
  def index
  end

  def create
  	render text: params[:project].inspect
  end

  def new
  end
end
