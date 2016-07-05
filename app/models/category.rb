class Category < ActiveRecord::Base

	has_many :posts, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy
end
