require 'sinatra/base'
require_relative 'functions'
require 'pry'
require 'active_record'

class MainProgram < Sinatra::Base
   get "/" do
      "the thing"
   end
end