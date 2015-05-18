class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # find if any user has that email
    user = User.find_by(name: params[:username])
    
    # if that user exists and it has a password that was sent
    if user && user.authenticate(params[:password])
      
      # save the user_id in the session hash
      session[:user_id] = user.id

      puts "logged in"

      # redirect to posts
      redirect_to '/posts'
    else
      # the email/password is wrong!
      @message = "This username and password combination does not exist."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path
  end

end
