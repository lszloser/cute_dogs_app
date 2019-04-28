class Dog < ApplicationRecord
  validates :secret, :picture_id, uniqueness: true, presence: true

  has_many :votes
  has_many :users, through: :votes

  scope :unvoted_by_user, -> (user) { where.not(id: Vote.voted_by_user(user).pluck(:dog_id)) } #not the most optimal solution
end