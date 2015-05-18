class UsersController < ApplicationController

  def create
    username = params["username"]
    password = params["password"]
    @user = User.create(name: username, password: password)
    session["user_id"] = @user.id
    redirect_to ("/posts")
  end

  def new
    #render out form
  end

end
