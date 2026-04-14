class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]
  before_action :authorize_user, except: [:index, :new, :create, :show]
  def index
    @users = User.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже вошли' if current_user.present?
    @user = User.new
  end

  def create
    redirect_to root_url, alert: 'Вы уже вошли' if current_user.present?
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Пользователь зарегистрирован'
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @user.update user_params
      redirect_to user_path @user, notice: 'Данные обновлены'
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @question_new = @user.questions.build
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :username, :password, :password_confirmation, :avatar_url)
  end
end
