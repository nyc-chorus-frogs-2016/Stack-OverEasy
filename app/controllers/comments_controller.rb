class CommentsController < ApplicationController

  if params[:comentable_type] == "Question"
    @commentable = Question.find(params[:commentable_id])
  elsif


end
