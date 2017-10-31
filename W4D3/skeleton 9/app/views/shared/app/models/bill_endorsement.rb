# == Schema Information
#
# Table name: bill_endorsements
#
#  id         :integer          not null, primary key
#  bill_id    :integer
#  senator_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class BillEndorsement < ActiveRecord::Base



end
