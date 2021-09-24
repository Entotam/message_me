class SessionController < ApplicationController

	before_action :require_user_redirect, only: [:new, :create]

	def new
		
	end

	def create
		user = User.find_by(username: params[:session][:username].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have logged in"
			redirect_to root_path
		else
			flash.now[:error] = "Wrong username or password"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out"
		redirect_to root_path
	end

	private

	def require_user_redirect
		if logged_in?
			flash[:error] = "You have already logged in"
			redirect_to root_path
		end
	end

end