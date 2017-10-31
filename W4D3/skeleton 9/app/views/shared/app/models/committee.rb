# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string
#  mandate        :string
#  chairperson_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Committee < ActiveRecord::Base


end
