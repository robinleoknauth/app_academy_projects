# == Schema Information
#
# Table name: parties
#
#  id              :integer          not null, primary key
#  name            :string
#  color           :string
#  ideology_id     :integer
#  party_leader_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Party < ActiveRecord::Base


end
