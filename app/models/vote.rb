class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  scope :voted_by_user, -> (user) { where(user_id: user) }
end
