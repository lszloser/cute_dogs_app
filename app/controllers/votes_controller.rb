class VotesController < ApplicationController
before_action :authenticate_user!

  def vote
    @dog = Dog.find(params[:dog_id])
    @vote = Vote.new(user: current_user, dog: @dog)
    @dog.cuteness += 1
    if (@vote.save && @dog.save)
        redirect_to root_path
    end
  end

  private
  def dog_params
    params.fetch(:dog).permit(:id)
  end

end
