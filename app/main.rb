require 'sinatra/base'
require 'pry'
require 'active_record'

require_relative 'ar_initial'
require_relative 'functions'

class MainProgram < Sinatra::Base
   
   before do
      User.find_or_create_by_id(0, :first_name => "Default", :last_name => "User", :username => 'Admin')
      @set = Setting.find_or_create_by_id(0, :user_id => 0)
   end
      
   #homepage
   get "/" do
      @posts = Post.all
      erb :homepage
   end
   
   get "/new_user" do
      erb :new_user
   end
   post "/new_user" do
      

      user = User.create do |u|
        u.first_name = params[:first_name]
        u.last_name = params[:last_name]
        u.username = params[:username]
      end
      
      redirect to("/users")
   end
   
   get "/users" do
      @users = User.all
      erb :users
   end
   
   get "/user/:user_id" do
      @user = User.find(params[:user_id])
      erb :user
   end
   
   post "/delete_user/:user_id" do
      User.delete(params[:user_id])
      redirect to("/users")
   end
   
   get "/edit_user/:user_id" do
      @user = User.find(params[:user_id])
      
      erb :edit_user
   end
   
   post "/edit_user" do
      user = User.find(params[:user_id])

        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.username = params[:username]
        user.save
        
      redirect to("/users")
   end
   
   get "/new_post" do
      erb :new_post
   end
   post "/new_post" do
      Post.create(:title => params[:title], :content => params[:content])
      redirect to("/posts")
   end
   
   get "/post/:post_id" do
      @post = Post.find(params[:post_id])
      erb :post
   end
   
   get "/edit_post/:post_id" do
      @post = Post.find(params[:post_id])
      erb :edit_post
   end
   
   post "/edit_post" do
      post = Post.find(params[:post_id])
      title = params[:title]
      content = params[:content]
      author = params[:user_id]
      post.update(:title => title, :content => content, :user_id => author)
      post.save
      
      redirect to("/posts")
   end
   
   get "/posts" do
       @posts = Post.all
       erb :posts
   end
   
   get "/new_page" do
   end
   
   get "/edit_page/:page_id" do
   end
   
   get "/page/:page_id" do
   end
   
   get "/pages" do
   end
   
   get "/settings" do
      
      erb :settings
   end
   
   post"/settings" do
      params.each do |k,v|
         if v == ""
            params[k] = nil
            #binding.pry
         end

      end
         #binding.pry      
      if params[:user_id] then @set.user_id = params[:user_id] end
      if params[:site_title] then @set.site_title = params[:site_title] end
      if params[:site_name] then @set.site_name = params[:site_name] end
      if params[:date_format] then @set.date_format = params[:date_format] end
      if params[:time_format] then @set.time_format = params[:time_format] end
      if params[:main_posts] then @set.main_posts = params[:main_posts] end
      
      @set.save
      
      redirect to("/settings")
      
   end
   
   get "/new_comment" do
   end
   
   get "/edit_comment/:comment_id" do
   end
end










