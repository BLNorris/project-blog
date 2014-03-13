require 'sinatra/base'
require 'pry'
require 'active_record'

require_relative 'ar_initial'
require_relative 'functions'

class MainProgram < Sinatra::Base
   
   before do
      set = Setting.find()
   end
   
   get "/" do
      "the thing"
      
      erb :homepage
   end
end