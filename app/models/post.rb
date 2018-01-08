class Post < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :class_name => "PostsLike",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
