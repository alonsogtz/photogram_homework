class User < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :posts,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
