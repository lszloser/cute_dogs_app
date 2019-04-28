class DogsController < ApplicationController
before_action :authenticate_admin!

    def index
        @dogs = Dog.all
    end

end
