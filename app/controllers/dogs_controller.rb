class DogsController < ApplicationController
before_action :authenticate_user!

    def index
      if current_user.admin?
        @date_from = params[:date_from]
        @date_to = params[:date_to]
        if @date_from.present? && @date_to.present?
          @dogs = Dog.top_dogs(@date_from,@date_to).paginate(page: params[:page], per_page: 10).order('cuteness DESC')
        else
          @dogs = Dog.paginate(page: params[:page], per_page: 10).order('cuteness DESC')
        end
      else
        redirect_to root_path
      end
    end

end
