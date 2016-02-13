class QuestionsController < ApplicationController
  def index
    if params[]
    @questions = Question.all
  end

  def latest
  end

  def trending
  end

  def highestvoted
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @question_comments = @question.recent_comments
    @answers = @question.answers


    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
       render :new
    end
  end

  def edit
  end

  private
    def question_params
      params.require(:question).permit(:title, :content).merge(questioner: current_user)
    end
end
