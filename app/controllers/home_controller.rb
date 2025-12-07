class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @welcome_message = "Добро пожаловать на наш сайт!"
  end
end
