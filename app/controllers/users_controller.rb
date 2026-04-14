class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Пользователь зарегестрирован'
    end
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

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :username, :password, :password_confirmation, :avatar_url)
  end
end
