class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    # @commentable =
  end

  def create
    if params[:comentable_type] == "Question"
      @commentable = Question.find(params[:commentable_id])
    elsif params[:commentable_type]  == 'Answer'
      @commentable = Answer.find(params[:commentable_id])
    end

    @comment = @commentable.comments.build(comment_params)
      if @comment.save
        redirect_to
      else
      end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(commenter: current_user)
    end
end
