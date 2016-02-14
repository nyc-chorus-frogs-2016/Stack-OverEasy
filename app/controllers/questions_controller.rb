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
    # @answers = @question.answers

    # ANSWER sorting logic below:
    if  params[:aorder] == "highest"
      @answers = Answer.by_points
    elsif params[:aorder] == "recent"
      @answers = Answer.recent_answers
    elsif params[:aorder] == "trending"
      @answers = Answer.by_trending
    else
      @answers = Answer.all
    end
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

  # Sort: <%= link_to 'Highest-Voted Answer', questions_path((@question){aorder: :highest}) %> |
