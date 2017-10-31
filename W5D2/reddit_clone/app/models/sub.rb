class Sub < ApplicationRecord

  has_many :postsubs,
  inverse_of: :sub,
  dependent: :destroy

  has_many :posts,
  through: :postsubs,
  source: :posts

  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: :User
end
