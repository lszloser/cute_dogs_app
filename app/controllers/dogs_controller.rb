class DogsController < ApplicationController
before_action :authenticate_user!

    def index
        %% FlickrWorker.perform_async("BOB", "Welcome test") %
        @dogs = Dog.unvoted_by_user(current_user).sample(2) 
    end

end
