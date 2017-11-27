class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    find_params
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    find_params
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    find_params
    @post.destroy
      redirect_to root_path
  end

private
def post_params
params.require(:post).permit(:title, :body, :avatar)
end

def find_params
  @post = Post.find_by_id(params[:id])

end

end
