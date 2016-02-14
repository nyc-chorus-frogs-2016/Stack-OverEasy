class CommentsController < ApplicationController

  def new
    if params[:answer_id]
      @commentable = Answer.find(params[:answer_id])
    else
      @commentable = Question.find(params[:question_id])
    end
    @comment = Comment.new
  end


  def create
    if params[:answer_id]
      @commentable = Answer.find(params[:answer_id])
    else
      @commentable = Question.find(params[:question_id])
    end

    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      if params[:answer_id]
        redirect_to question_path(@comment.commentable.question_id)
      else
        redirect_to question_path(@comment.commentable)
      end
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(commenter: current_user)
    end
end
