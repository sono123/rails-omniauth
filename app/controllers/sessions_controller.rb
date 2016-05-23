
class SessionsController < ApplicationController

	def new
		redirect_to '/auth/twitter'
	end

  def create
    auth = request.env["onmiauth.auth"]

    user = User.where(:provider => auth['provider'],
    									:uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    debugger
    
    redirect_to root_url, :notice => 'Signed In!'
  end

  def destroy
  	reset_session
  	redirect_to	root_url, :notice => 'Signed Out!'
  end

  def failure
  	redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
