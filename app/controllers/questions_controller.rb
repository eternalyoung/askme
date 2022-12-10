class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide unhide]
  def create 
    question = Question.create(question_params)

    redirect_to question_path(question)
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def show
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to @question
  end

  def unhide
    @question.update(hidden: false)
    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
