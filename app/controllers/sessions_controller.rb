class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:notice] = "Login successful"
			redirect_to user_path(@user)
		else
			flash[:errors] = "Invalid login"
			render :new
		end
	end

	def destroy
		session.clear
		redirect_to users_path
	end
end
