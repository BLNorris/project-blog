require 'spec_helper'


describe User do
   
   before(:all) do
      
      #do something before all tests
   end

   before(:each) do
      #do something before each test
   end

   it "creates a user" do
     andy = User.create(:first_name => "Michael", :last_name => "Michael", :username => "MM" )
     
     andytest = User.find(andy.id)
     expect(andytest.first_name).to eq("Michael")
   end
   
   after(:all) do
      #do something after all tests
      User.delete_all
   end
   
end


