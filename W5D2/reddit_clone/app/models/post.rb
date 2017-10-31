class Post < ApplicationRecord

  validates :title, :sub, presence: true

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  has_many :postsubs,
  inverse_of: :post,
  dependent: :destroy

  has_many :subs,
  through: :postsubs,
  source: :subs

end
