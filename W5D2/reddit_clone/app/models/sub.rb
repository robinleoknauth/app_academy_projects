class Sub < ApplicationRecord

  has_many :post_subs,
  inverse_of: :sub,
  dependent: :destroy

  has_many :posts,
  through: :post_subs,
  source: :post

  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: :User
end
