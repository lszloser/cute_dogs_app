class Dog < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  scope :unvoted_by_user, -> (user) { where.not(id: Vote.voted_by_user(user).pluck(:dog_id)) } #not the most optimal solution
end