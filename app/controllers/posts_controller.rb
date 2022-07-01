class PostsController < ApplicationController
  before_action :fetch_post, only: %i[ show edit update destroy]

  def index
    @posts = Post.all
  end

  # view
  def show; end

  # view
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    return redirect_to @post if @post.save

    render :new
  end

  # view
  def edit; end

  def update
    return redirect_to @post if @post.update(post_params)

    render :new
  end

  def destroy
    return redirect_to @post, notice: 'Apagado com sucesso' if @post.destroy

    render :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def fetch_post
    @post = Post.find(params[:id])
  end
end
