class Comment < ApplicationRecord
  # Direct associations

  has_many   :comment_likes,
             :dependent => :destroy

  belongs_to :post

  belongs_to :commenter,
             :class_name => "User"

  # Indirect associations

  has_many   :likes,
             :through => :comment_likes,
             :source => :user

  # Validations

end
