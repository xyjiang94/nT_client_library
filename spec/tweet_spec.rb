require_relative '../client.rb'
require 'date'



describe "Tweet" do

  before(:all) do
    Tweet.base_uri = "http://0.0.0.0:4567"
    @testuser = User.find_by_name("testuser")
  end



  it "should get a tweet" do
    get_tweet = Tweet.find_by_id(@tweet["id"])
    expect(get_tweet["id"]).to eql(@tweet["id"])
  end


end
