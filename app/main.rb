require 'sinatra/base'
require 'pry'
require 'active_record'

require_relative 'ar_initial'
require_relative 'functions'

class MainProgram < Sinatra::Base
   get "/" do
      "the thing"
   end
end