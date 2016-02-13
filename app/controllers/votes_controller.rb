class VotesController < ApplicationController

  def create
    if params[:answer_id]
      @votable = Answer.find(params[:answer_id])
    else
      @votable = Question.find(params[:question_id])
    end

    @vote = @votable.votes.build(vote_params)
    if @vote.save
      if params[:answer_id]
        redirect_to question_path(@vote.votable.question_id)
      else
        redirect_to question_path(@vote.votable)
      end
    else
      render :new
    end
  end

  # def create
  #   vote = Vote.new(vote_params)
  #   binding.pry
  #   if vote.save
  #     if request.xhr?
  #       {vote}.to_json
  #     else
  #       redirect_to question_path
  #     end
  #   else
  #     return [507, "Your upvote on this post could not be saved, we're sorry"]
  #   end

  end


  private
    def comment_params
      params.require(:comment).permit(:val).merge(voter: current_user)
    end

end
