class HomeController < ApplicationController
  def index
    @welcome_message = "Добро пожаловать на наш сайт!"
  end
end
