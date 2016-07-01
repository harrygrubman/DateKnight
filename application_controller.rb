require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class ApplicationController < Sinatra::Base

  #begin twilio ruby code
account_sid ||= ENV["account_sid"]
auth_token ||= ENV["auth_token"]

#end twilio ruby code

  get '/' do
    erb :index
  end

  post '/results' do
    @fandangoURL = fandango(params[:zipCode], params[:date])
    @yelpURL = yelp(params[:zipCode], params[:category])
    @happycowURL = happycow(params[:zipCode])
    erb :results
  end

  post '/yelp' do

		# @message = params[:message] + " --Sent from https://date-knight.herokuapp.com/"
		# @destination = params[:destination]
		# @puppy = params[:puppy]

		@client = Twilio::REST::Client.new(account_sid, auth_token) # set up a client to talk to the Twilio REST API

		@client.account.messages.create({
			:from => '+16692383283 ',
			:to => '+14752235842',
			:body => 'this'
		})
    puts params
		erb :yelp
  end

end
