# == Schema Information
#
# Table name: senators
#
#  id         :integer          not null, primary key
#  fname      :string
#  lname      :string
#  state      :string
#  party_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Senator < ActiveRecord::Base



end
