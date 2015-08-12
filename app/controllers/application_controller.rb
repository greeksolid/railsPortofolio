class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
		def logged_in?
			unless session[:user_id]
				flash[:notice] = "Please login."
				redirect_to :controller => 'access', :action => 'login'
				return false
			else
				return true
			end
		end

		def filter_projects
			# if there is a get request from the index page form
		    if params[:category]
		      # get category id
		      @category_id = params[:category][:category_id]
		    else
		      @category_id = nil
		    end

		    # if category_id is set
		    unless @category_id.blank?
		      @category_name = Category.find(@category_id).name
		      @projects = Project.all.where(:category_id => @category_id)
		    else
		      # if empty or nil
		      @projects = Project.find(:all, order: "id desc")
		    end
		end
end
