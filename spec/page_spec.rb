require 'spec_helper'


describe Page do
   
   before(:all) do
      
      #do something before all tests
   end

   before(:each) do
      #do something before each test
   end

   it "creates a user" do
     andy = User.create(:first_name => "Michael", :last_name => "Michael", :username => "MM" )
     pg = Page.create(:user_id => andy.id, :title => "test-page", :content => "test content")
     
     andytest = User.find(pg.user.id)
     expect(andytest.first_name).to eq("Michael")
   end
   
   after(:all) do
      #do something after all tests
      User.delete_all
   end
   
end


