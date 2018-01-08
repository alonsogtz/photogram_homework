class PostsLike < ApplicationRecord
  # Direct associations

  belongs_to :post

  belongs_to :user

  # Indirect associations

  # Validations

end
