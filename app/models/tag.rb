class Tag < ActiveRecord::Base

	has_many :posts, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy

	validates :slug, uniqueness: { :message => " already exists" }
	validates :tag_name, presence: { :message => " is required" }

end
