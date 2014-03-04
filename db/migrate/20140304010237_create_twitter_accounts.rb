class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table "twitter_accounts", force: true do |t|
    t.string   "handle"
    t.timestamps
    end
  end
end
