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
# User.joins(:received_comments).group(:id).order('sum(comments.like_value) desc')

# joins(:answers).group(:id).order('sum(answers.votes.value) desc')
