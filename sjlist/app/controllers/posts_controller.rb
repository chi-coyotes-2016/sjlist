class PostsController < ApplicationController
  include ApplicationHelper
  def index
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
      @posts = @category.posts.order(updated_at: :desc)
    else
      @posts = Post.order(updated_at: :desc)
    end
  end

  def new
    @post = Post.new
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
    end
  end

  def create
    if logged_in?
      @post = Post.new(post_params)
      @post.author = current_user
      if params[:category_id]
        @category = Category.find_by(id: params[:category_id])
      end
      if @post.save
        redirect_to @post
      else
        @errors = @post.errors.full_messages
        render :new
      end
    else
      @errors = ["You are not logged in"]
      render 'sessions/new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    if logged_in?
      @post = Post.find(params[:id])
      if current_user = @post.author
        @category = @post.category
        render :edit
      else
        @errors = ["You are not the creator of this..."]
        redirect_to @post
      end
    else
      @errors = ["You are not logged in"]
      render 'sessions/new'
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    if logged_in?
      @post = Post.find(params[:id])
      if current_user = @post.author
        @post.destroy
        # change this to category index when created
        redirect_to @post.category
      else
        @errors = ["You are not the creator of this..."]
        redirect_to @post
      end
    else
      @errors = ["You are not logged in"]
      render 'sessions/new'
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
