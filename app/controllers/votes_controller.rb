class VotesController < ApplicationController

  def create
    if params[:answer_id]
      @votable = Answer.find(params[:answer_id])
    else
      @votable = Question.find(params[:question_id])
    end

    if !@votable.voted.include?(current_user.id)
      @vote = @votable.votes.build(value: params[:value], voter: current_user)
      if @vote.save
        if request.xhr?
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
  end

  private
    def vote_params
      params.require(:vote).permit(:value).merge(voter: current_user)
    end

end
