class CreateFlickrPosts < ActiveRecord::Migration
  def change
    create_table "flickr_posts", force: true do |t|
      t.string "caption"
      t.timestamps
    end
  end
end
