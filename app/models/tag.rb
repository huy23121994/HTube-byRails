class Tag < ActiveRecord::Base

	has_many :posts, :through => :tags_posts
	has_many :tags_posts, dependent: :destroy

	validates :slug, uniqueness: { :message => " already exists" }
	validates :tag_name, presence: { :message => " is required" }

end
