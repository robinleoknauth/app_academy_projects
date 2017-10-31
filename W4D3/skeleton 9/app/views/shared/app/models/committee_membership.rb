# == Schema Information
#
# Table name: committee_memberships
#
#  id           :integer          not null, primary key
#  senator_id   :integer
#  committee_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class CommitteeMembership < ActiveRecord::Base

  

end
