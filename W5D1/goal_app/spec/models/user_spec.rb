require 'rails_helper'

RSpec.describe User, type: :model do

  RSpec.describe User, type: :model do



    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }



  end
end
