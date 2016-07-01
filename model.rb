require 'twilio-ruby'

def fandango(zipCode, date)
  "http://www.fandango.com/" + zipCode.to_s + "_movietimes?date=" + date.to_s + "&q=" + zipCode.to_s
end

def yelp(zipCode, category)
  "http://www.yelp.com/search?find_desc=Restaurants&find_loc=" + zipCode.to_s + "&start=0&cflt=" + category.to_s
end

def happycow(zipCode)
  "https://www.happycow.net/searchmap?location=" + zipCode.to_s + "&vegan=true&vegetarian=true&vegfriendly=true"
end

def send_sms
  @client = Twilio::REST::Client.new('SKb0e684e12330999147880edc4e39f79a', 'vRpBFDDOCFcyMqqrz8gLg1esFo7xgEKS') # set up a client to talk to the Twilio REST API
    :from => '+16692383283',
    :to => '+14752235842',
    :body => "alert_message"
  })
  puts "An SMS notifying the last application error was "\
       "sent to #{message.to[0...-4] + "****"}"
end
