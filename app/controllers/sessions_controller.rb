class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # Просто показываем форму входа
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Вход выполнен успешно!'
    else
      flash.now[:alert] = 'Неверный email или пароль'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Выход выполнен успешно!'
  end
end
