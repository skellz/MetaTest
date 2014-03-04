class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table "facebook_posts", force: true do |t|
      t.string "body"
      t.string "external_id"
      t.timestamps
    end
  end
end
