class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      redirect_to 'new'
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  # Security feature for rails that specifies what should be passed when creating a post
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
