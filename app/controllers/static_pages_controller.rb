class StaticPagesController < ApplicationController
  
  def home
    # @latest_projects = Project.find(:all, order: "id desc", limit: 4)
    filter_projects
  end

  def about
  end
  
end
