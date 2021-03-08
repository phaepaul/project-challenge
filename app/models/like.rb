class Like < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validate :check_owner
  validates_uniqueness_of :dog_id, scope: [:user_id], message: "You've already liked the dog."

  def check_owner
    if user == dog&.owner
     errors.add :user, 'You cannot like your own pup.'
    end
  end
end

