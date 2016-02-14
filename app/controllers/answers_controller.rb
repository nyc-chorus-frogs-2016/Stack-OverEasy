class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to  question_path(@answer.question_id)
    else
       render @answer.question_id
    end
  end


  private

    def answer_params
      params.require(:answer).permit(:content, :question_id).merge(responder: current_user)
    end
end

  # Sort: <%= link_to 'Highest-Voted Answer', questions_path{@question, :order => 'highest'} %> |
