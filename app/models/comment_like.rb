class CommentLike < ApplicationRecord
  # Direct associations

  belongs_to :comment

  belongs_to :user

  # Indirect associations

  # Validations

end
