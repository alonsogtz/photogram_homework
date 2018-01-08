class User < ApplicationRecord
  # Direct associations

  has_many   :comment_likes,
             :dependent => :destroy

  has_many   :likes,
             :class_name => "PostsLike",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :posts,
             :dependent => :destroy

  # Indirect associations

  has_many   :past_likes,
             :through => :likes,
             :source => :post

  has_many   :past_comments,
             :through => :comments,
             :source => :post

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
