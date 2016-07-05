class AddUniqueSlugtoPostsCategories < ActiveRecord::Migration
  def change
  	add_index :categories, :slug, :unique => true
  	add_index :posts, :slug, :unique => true
  end
end
