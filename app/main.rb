require 'sinatra/base'
require 'pry'
require 'active_record'
require 'will_paginate'
require 'will_paginate/active_record'


require_relative 'ar_initial'
require_relative 'functions'

class MainProgram < Sinatra::Base
   
   before do
      User.find_or_create_by_id(0, :first_name => "Default", :last_name => "User", :username => 'Admin')
      @set = Setting.find_or_create_by_id(0, :user_id => 0)
      @pages = Page.all
   end
      
   #homepage
   get "/" do
      @page = params{:page} || 1
      posts = Post.all
      @post_pages = []
      posts.each_slice(100) do |slice|
         @post_pages << slice
      end
      @posts = @post_pages[@page - 1]
      
      erb :homepage
   end
   
   get "/admin/new_user" do
      erb :"admin/new_user" , :layout => :"admin/layout"
   end
   post "/admin/new_user" do
      Create.user(params)
      redirect to("/admin/users")
   end
   
   get "/admin/users" do
      @users = User.all
      erb :"admin/users" , :layout => :"admin/layout"
   end
   
   get "/admin/user/:user_id" do
      @user = User.find(params[:user_id])
      erb :"admin/user" , :layout => :"admin/layout"
   end
   
   post "/admin/delete_user/:user_id" do
      User.delete(params[:user_id])
      redirect to("/admin/users")
   end
   
   get "/admin/edit_user/:user_id" do
      @user = User.find(params[:user_id])
      
      erb :"admin/edit_user" , :layout => :"admin/layout"
   end
   
   post "/admin/edit_user" do
      user = User.find(params[:user_id])

        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.username = params[:username]
        user.save
        
      redirect to("/admin/users")
   end
   
   get "/admin/new_post" do
      erb :"admin/new_post" , :layout => :"admin/layout"
   end
   post "/admin/new_post" do
      
       Post.create do |p|
          p.title = params[:title]
          p.content = params[:content]
          p.user_id = params[:user_id]
       end
       
      redirect to("/admin/posts")
   end
   
   get "/post/:post_id" do
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      erb :post
   end
   
   get "/admin/edit_post/:post_id" do
      @post = Post.find(params[:post_id])
      erb :"admin/edit_post" , :layout => :"admin/layout"
   end
   
   post "/admin/edit_post" do
      post = Post.find(params[:post_id])
      title = params[:title]
      content = params[:content]
      author = params[:user_id]
      post.update(:title => title, :content => content, :user_id => author)
      post.save
      
      redirect to("/admin/posts")
   end
   
   get "/admin/posts" do
       @posts = Post.all
       erb :"admin/posts" , :layout => :"admin/layout"
   end
   
   get "/admin/new_page" do
      erb :"admin/new_page" , :layout => :"admin/layout"
   end
   
   post "/admin/new_page" do
      Page.create do |p|
         p.title = params[:title]
         p.content = params[:content]
         p.user_id = params[:user_id]
      end
      
     redirect to("/admin/pages")
   end
   
   get "/admin/edit_page/:page_id" do
      @page = Page.find(params[:page_id])
      
      erb :"admin/edit_page" , :layout => :"admin/layout"
   end
   
   post "/admin/edit_page" do
      
   page = Page.find(params[:post_id])
   title = params[:title]
   content = params[:content]
   author = params[:user_id]
   page.update(:title => title, :content => content, :user_id => author)
   page.save
   
   redirect to("/admin/pages")
   end

   get "/page/:page_id" do
      @page = Page.find(params[:page_id])
      erb :page
   end
   
   get "/admin/pages" do
      @pages = Page.all
      erb :"admin/pages" , :layout => :"admin/layout"
   end
   
   get "/admin/settings" do
      
      erb :"admin/settings" , :layout => :"admin/layout"
   end
   
   post"/admin/settings" do
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
      
      redirect to("/admin/settings")
      
   end

   get "/new_comment/:post_id" do
      @post_id = params[:post_id]
      
      erb :new_comment
   end
      
   post "/post_new_comment/:post_id" do
      Comment.create do |p|
         p.title = params[:title]
         p.content = params[:content]
         p.user_id = params[:user_id]
         p.post_id = params[:post_id]
      end
      
      redirect to("/post/#{params[:post_id]}")
   end
   
end










