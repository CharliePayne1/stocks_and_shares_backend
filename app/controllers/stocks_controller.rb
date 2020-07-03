class StocksController < ApplicationController
# need a stock controller but no stock model as we are not storing them in the backend 
# ask our backend to fetch the information for us rather than the frontend
# http requests library which will deal with fetch requests - rest-rlient is a gem 
# when we require the gem, we can use the RestClient 
# have two routes in our stock controller: index and show 
# dont build out all the routes and actions until we have built the front end 

  def index
    response = HTTParty.get("https://spreadsheets.google.com/feeds/list/0AhySzEddwIC1dEtpWF9hQUhCWURZNEViUmpUeVgwdGc/1/public/basic?alt=json", headers: { 
      "Accept" => "application/json"
    })
    render json: response.to_h
  end


  def show

  end

end
