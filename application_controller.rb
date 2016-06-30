require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/results' do
    @fandangoURL = fandango(params[:zipCode], params[:date])
    @yelpURL = yelp(params[:zipCode])
    erb :results
  end

end
