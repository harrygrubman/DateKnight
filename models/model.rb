def fandango(zipCode, date)
  "http://www.fandango.com/" + zipCode.to_s + "_movietimes?date=" + date.to_s + "&q=" + zipCode.to_s
end
