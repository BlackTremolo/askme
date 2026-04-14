class SessionsController < ApplicationController
  def new
    redirect_to root_url, alert: 'Вы уже вошли' if current_user.present?
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Вы успешно вошли в профиль'
    else
      flash.now.alert = 'Неправильный логин или пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
