class QuestionsController < ApplicationController
  def index
    if  params[:order] == "highest"
      @questions = Question.by_points
    elsif params[:order] == "recent"
      @questions = Question.recent_questions
    elsif params[:order] == "trending"
      @questions = Question.by_trending
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @question_comments = @question.recent_comments

    if  params[:aorder] == "highest"
      @answers = Answer.by_points
    elsif params[:aorder] == "recent"
      @answers = Answer.recent_answers
    elsif params[:aorder] == "trending"
      @answers = Answer.by_trending
    else
      @answers = Answer.all
    end

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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def best
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @question.best_answer_id = @answer.id
    @question.save
    redirect_to question_path(@question)
  end

  private
    def question_params
      params.require(:question).permit(:title, :content).merge(questioner: current_user)
    end
end

