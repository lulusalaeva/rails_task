class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_post, only: [:edit, :update, :destroy]
  before_action :find_any_post, only: :show

  respond_to :html

  def index
    @posts = current_user.posts.paginate(:page => params[:page])
  end

  def show
    @comments = @post.comments.paginate(:page => params[:page])
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post was edited!"
      redirect_to user_post_path(current_user, @post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post was destroyed"

    redirect_to user_posts_path(current_user)
  end

  private
    def find_post
      @post = current_user.posts.find(params[:id])
    end

    def find_any_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :title)
    end
end
