require 'sinatra'

VERSION = "2.0" # Choose the dataset you want to grab from

# Require in all the files from lib/
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

set :port, 8227 # 8227 spells "UCAS" ;)

get '/' do
  @results = UCAS::Datastore.all()  
  erb :index
end