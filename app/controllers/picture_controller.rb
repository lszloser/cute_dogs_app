class PictureController < ApplicationController

    def index
        MyWorker.perform_async("BOB", "Welcome test")
    end
end
