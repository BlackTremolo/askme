class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('13.04.2026'))
    ]
    @question_new = Question.new
  end
end
