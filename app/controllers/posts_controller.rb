class PostsController < ApplicationController


  before_action :authenticate, except: [:index, :new, :create]
  def index
    if session["user_id"] && User.find(session["user_id"]).admin?
      @current_user = User.find(session["user_id"])
      @posts = Post.all
      render :admindex
    elsif session["user_id"]
      @current_user = User.find(session["user_id"])
      @posts = Post.all
      render :index
    else
      redirect_to "/"
    end
  end

  def create
    @current_user = User.find(session["user_id"])
    @post = Post.create({username: @current_user.name, title: params["title"], contents: params["contents"]})
    redirect_to "/posts"
  end

  def destroy
    post = Post.find(params["id"])
    post.destroy
    redirect_to "/posts"
  end


end
