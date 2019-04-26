class DogsController < ApplicationController

    def index
        %% FlickrWorker.perform_async("BOB", "Welcome test") %
        if Dog.all.any? 
            @dog = Dog.find(rand(1..100) - 1)
        end
    end

end
