class CommentsController < ApplicationController
  respond_to :html

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Commented!"
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end

    redirect_to user_post_path(@comment.user, @comment.post)
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
