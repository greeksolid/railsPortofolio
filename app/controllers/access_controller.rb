class AccessController < ApplicationController

	before_action :logged_in?, :except => [:login, :attempt_login, :logout]

	def index
		filter_projects

    @categories   = Category.all
    @technologies = Technology.all.order(:name)

    render 'projects/index'
	end

	def login
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
			found_user = AdminUser.find_by_username(params[:username])

			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end

		if authorized_user
			session[:user_id]  = authorized_user.id
			session[:username] = authorized_user.username
			flash[:notice] = "Welcome to the admin panel."
			redirect_to :action => 'index'
		else
			flash[:error] = "Invalid username/password combination."
			redirect_to :action => 'login'
		end
	end

	def logout
		session.clear

		flash[:notice] = "You have successfully logged out."

		redirect_to root_path
	end

end