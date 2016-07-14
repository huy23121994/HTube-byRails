class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user
	  	if user.authenticate(params[:session][:password])
	  		sign_in user
	  		redirect_to user
	  	else
	  		flash[:danger] = 'Password is not correct!'
	  		redirect_to :back
		end
	else
  		flash[:danger] = "Don't exist this user"
  		redirect_to :back
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
