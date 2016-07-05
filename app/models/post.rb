class Post < ActiveRecord::Base

	has_many :categories, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy

	validates :title, presence: { :message => " is required" }
	validates :img_preview, presence: { :message => " is required" }
	validates :embed_link, presence: { :message => " is required" }
	# validates :slug, presence: { :message => " is required" }
	# validates :slug, uniqueness: { :message => " already exists" }
	
end
