class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    binding.pry
    if vote.save
      if request.xhr?
        {vote}.to_json
      else
        redirect_to question_path
      end
    else
      return [507, "Your upvote on this post could not be saved, we're sorry"]
    end

  end


  private

  def vote_params
    params.require(:vote).permit(:value, :voter_id, :votable_type, :votable_id)
  end

end
