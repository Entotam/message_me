class SessionController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(username: params[:session][:username].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "You have logged in"
			redirect_to root_path
		else
			flase[:alert] = "Wrong username or password"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to root_path
	end

end