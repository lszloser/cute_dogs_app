class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    @dogs = Dog.unvoted_by_user(current_user).sample(2)
  end
  
end
