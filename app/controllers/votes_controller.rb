class VotesController < ApplicationController

  def create
    if params[:answer_id]
      @votable = Answer.find(params[:answer_id])
    else
      @votable = Question.find(params[:question_id])
    end

    @vote = @votable.votes.build(value: params[:value], voter: current_user)
        # binding.pry
    if @vote.save
      if request.xhr?
        # binding.pry
        render :json => {votable_id: @votable.id, votable_vote_count: @votable.vote_count}
      else
        if params[:answer_id]
          redirect_to question_path(@vote.votable.question_id)
        else
          redirect_to question_path(@vote.votable)
        end
      end
    else
      if params[:answer_id]
         render question_path(@vote.votable.question_id)
      else
         render question_path(@vote.votable)
      end
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
# end



  private
    def vote_params
      params.require(:vote).permit(:value).merge(voter: current_user)
    end

end
