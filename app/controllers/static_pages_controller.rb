class StaticPagesController < ApplicationController
  
  def home
    @latest_projects = Project.find(:all, order: "id desc", limit: 3)
  end

  def about
  end
  
end
