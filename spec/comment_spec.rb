require 'spec_helper'


describe Comment do
   
   before(:all) do
      
      #do something before all tests
   end

   before(:each) do
      #do something before each test
   end

   it "creates a user" do
     andy = User.create(:first_name => "Michael", :last_name => "Michael", :username => "MM" )
     
     post = Post.create(:user_id => andy.id, :title => "test-post", :content => "test content")
     com = Comment.create(:user_id => andy.id, :title => "test-comment", :post_id => post.id, :content => "test content")
     
    
     comtest = Comment.find(com.id)
   #binding.pry
     expect(comtest.post.user.first_name).to eq("Michael")
   end
   
   after(:all) do
      #do something after all tests
      User.delete_all
   end
   
end


