require_relative '../../spec_helper'

describe Dish::Mwanaspoti do
  
  decribe "default attributes" do

    it "must include httparty methods" do
      Dish::Mwanaspoti.must_include HTTParty
    end

    it "must have the base url set to the Dribble API endpoint" do
      Dish::Mwanaspoti.base_uri.must_equal 'http://api.dribble.com'
    end
    
  end

  describe "default instance attributes" do
    let (:player)
  end

  describe "Get profile" do

    let(:mwanaspoti) { Dish::Mwanaspoti.new}

    before do
      VCR.insert_cassette 'mwanaspoti', :record => :new_eposides
    end

    after do
      VCR.eject_cassette
    end

    it "must have a profile method" do
      mwanaspoti.must_respond_to :profile
    end 

    it "must parse the api response from JSON to Hash" do
      mwanaspoti.profile.must_be_instance_of Hash
    end

    it "msut perform the request and get the data" do
      mwanaspoti.profile.["username"].must_equal 'simplebits'
    end

    it "records the fixture" do
      Dish::Mwanaspoti.get('/mwanaspoti/simplebits')
    end

  end

end

# describe Dish::Mwanaspoti do
 
#   describe "default attributes" do
 
#     it "must include httparty methods" do
#       Dish::Player.must_include HTTParty
#     end
 
#     it "must have the base url set to the Dribble API endpoint" do
#       Dish::Player.base_uri.must_equal 'http://api.dribbble.com'
#     end
 
#   end
 
# end