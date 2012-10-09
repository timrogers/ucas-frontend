require 'sinatra'

VERSION = "2.0" # Choose the dataset you want to grab from

# Require in all the files from lib/
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

set :port, 8227 # 8227 spells "UCAS" ;)

get '/' do
  @results = UCAS::Datastore.all()
  
  # Here lies skanky codes, since UCAS have no API...
  @course_codes = {
    "L0V0" => {
      "university" => "University of Oxford",
      "course" => "Politics, Philosophy and Economics"
    },
    "L290" => {
      "university" => "Birkbeck, University of London",
      "course" => "Politics and Government"
    },
    "L202" => {
      "university" => "SOAS, University of London",
      "course" => "Politics"
    },
    "LV25" => {
      "university" => "London School of Economics",
      "course" => "Politics and Philosophy"
    },
    "L230" => {
      "university" => "London School of Economics",
      "course" => "Government"
    }
  }
  
  erb :index
end