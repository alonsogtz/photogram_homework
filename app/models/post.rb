class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :likes,
             :class_name => "PostsLike",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :likers,
             :through => :likes,
             :source => :user

  has_many   :commenters,
             :through => :likes,
             :source => :commenter

  # Validations

end
