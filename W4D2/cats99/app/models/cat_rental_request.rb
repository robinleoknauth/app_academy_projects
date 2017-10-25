class CatRentalRequest < ApplicationRecord

  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING ACCEPTED DECLINED) }

  belongs_to :cat

  def overlapping_requests
    # ActiveRecord::Base.connection.execute(<<-SQL, @cat_id, @start_date, @end_date)
    #   select
    #     id
    #   from
    #     cat_rental_requests
    #   where
    #     cat_id = ? AND (? IS BETWEEN start_date AND end_date) OR (? IS BETWEEN start_date AND end_date)
    # SQL

    # self.class.select(:*).where(cat_id: self.id).where( (start_date..end_date))

    CatRentalRequest.where.not(id: self.id)
    .where(cat_id: self.cat_id)
    .where.not('start_date > :end_date OR end_date < :start_date',
      start_date: self.start_date, end_date: self.end_date)
  end
end
