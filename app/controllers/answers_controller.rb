class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to  question_path(@answer.question_id)
    else
      render @answer.question_id
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question_id)
    else
      render :edit
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id).merge(responder: current_user)
    end
end
