require 'spec_helper'


describe Post do
   
   before(:all) do
      
      #do something before all tests
   end

   before(:each) do
      #do something before each test
   end

   it "creates a user" do
     andy = User.create(:first_name => "Michael", :last_name => "Michael", :username => "MM" )
     post = Post.create(:user_id => andy.id, :title => "test-post", :content => "test content")
     
     andytest = User.find(post.user.id)
     expect(andytest.first_name).to eq("Michael")
   end
   
   after(:all) do
      #do something after all tests
      User.delete_all
   end
   
end


