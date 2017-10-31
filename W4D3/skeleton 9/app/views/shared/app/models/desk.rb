# == Schema Information
#
# Table name: desks
#
#  id         :integer          not null, primary key
#  model      :string
#  owner_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Desk < ActiveRecord::Base



end
