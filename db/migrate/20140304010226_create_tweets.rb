class CreateTweets < ActiveRecord::Migration
  def change
    create_table "tweets", force: true do |t|
    t.integer  "twitter_account_id"
    t.string   "body"
    t.string   "external_id"
    t.timestamps
    end
  end
end
