module Dish
  
  class Mwanaspoti

    include HTTParty

    base_uri 'http://api.dribble.com'

    def profile
      self.class.get '/mwanaspoti/simplebits'
    end

  end
end