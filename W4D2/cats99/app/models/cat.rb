
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :name, presence: true
  validates :sex, presence: true, length: { maximum: 1 }, format: { with: /\A(M|F)\z/ }
  validates :color, inclusion: { in: %w(blue black grey orange white) }

  def age
    time_ago_in_words(birth_date)
  end

  has_many :requests,
  class_name: :CatRentalRequest,
  dependent: :destroy




end
