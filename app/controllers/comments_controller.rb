class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.new(comment_params)

    return redirect_to @post, notice: 'Comentário salvo' if @comment.save

    flash.now[:alert] = "Algo deu errado... :/"
  end

  def update
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.find(params[:id])
    redirect_to @post, notice: 'comentário atualizado' if @comment.update(comment_params)
  end

  def edit
    respond_to do |format|
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      format.js { render partial: 'comments/replace_form' }
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @post = @comment.post
    redirect_to @post, notice: 'Comentário apagado.' if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
