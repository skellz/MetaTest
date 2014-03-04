class TwitterAccount < ActiveRecord::Base
  include TwitterClient

  has_many :tweets
  after_save :import_tweets

  def import_tweets
    twitter_client.user_timeline(self.handle).each do |api_tweet|
      tweet = Tweet.new
      tweet.body = api_tweet.text
      tweet.external_id = api_tweet.id 
      self.tweets << tweet unless self.tweets.exists?(external_id: api_tweet.id)
    end
  end
end
