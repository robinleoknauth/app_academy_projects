require 'rails_helper'


RSpec.describe User, type: :model do



  subject(:user) do
    User.create!(username: "leo", password: "123456")
  end


  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }


   describe "password encryptioin" do
     it "doesnt save password to the database" do
       User.create!(username: "leo", password: "123456")
       user = User.find_by_username("leo")
       expect(user.password).not_to be("123456")
     end

     it "encrypt password using BCrypt" do
       expect(BCrypt::Password).to receive(:create)
       User.new(username: "leo", password: "123456")
     end
   end

end
