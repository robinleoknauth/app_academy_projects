# == Schema Information
#
# Table name: ideologies
#
#  id         :integer          not null, primary key
#  name       :string
#  direction  :string
#  goal       :string
#  created_at :datetime
#  updated_at :datetime
#

class Ideology < ActiveRecord::Base


end
