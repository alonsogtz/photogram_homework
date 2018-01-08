class Comment < ApplicationRecord
  # Direct associations

  belongs_to :post

  belongs_to :commenter,
             :class_name => "User"

  # Indirect associations

  # Validations

end
