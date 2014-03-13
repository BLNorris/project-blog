require 'spec_helper'


describe Setting do
   
   before(:all) do
      
      #do something before all tests
   end

   before(:each) do
      #do something before each test
   end

   it "creates a user" do
      setting = Setting.create(:site_title => "Test-Site")
      
     settingtest = Setting.find(setting.id)
     expect(settingtest.site_title).to eq("Test-Site")
   end
   
   after(:all) do
      #do something after all tests
      User.delete_all
   end
   
end


