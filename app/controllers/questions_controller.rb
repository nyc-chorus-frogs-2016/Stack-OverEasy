class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
