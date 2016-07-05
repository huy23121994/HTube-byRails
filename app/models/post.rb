class Post < ActiveRecord::Base

	has_many :categories, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy
end
