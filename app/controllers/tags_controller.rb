class TagsController < ApplicationController
  before_action :set_tag, only: :show

  def show
    @questions = @tag.questions
  end

  private

  def set_tag
    @tag = Tag.find_by(name: params[:name])
  end
end
