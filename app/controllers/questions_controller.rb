class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide unhide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide unhide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    @question = Question.new(question_params)
    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      redirect_to user_path(@question.user), notice: 'Ошибка при создании вопроса!'
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :user_id, :answer)
    @question.update(question_params)

    redirect_to user_path(@question.user), notice: 'Вопрос изменён!'
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user.id), notice: 'Вопрос удалён!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @question = Question.new
    @questions = Question.order(created_at: :desc)
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to user_path(@question.user), notice: 'Вопрос скрыт'
  end

  def unhide
    @question.update(hidden: false)
    redirect_to user_path(@question.user), notice: 'Вопрос больше не скрыт'
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
