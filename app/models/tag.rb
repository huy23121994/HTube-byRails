class Tag < ActiveRecord::Base

	has_many :posts, :through => :tags_posts
	has_many :tags_posts, dependent: :destroy

	validates :slug, uniqueness: { :message => " already exists" }
	validates :tag_name, presence: { :message => " is required" }

	def self.get_all_tags
		self.all
	end

	def self.get_tag(tag_id)
		self.find(tag_id)
	end

	def self.update_tag(tag_id,data_update)
		tag = self.find(tag_id)
		tag.tag_name = data_update['tag_name']
		tag.slug = data_update['slug']
		tag.save

		return tag
	end

	def self.create_tag(data_create)
		tag = self.new
		tag.tag_name = data_create['tag_name']
		tag.slug = data_create['slug']
		tag.save

		return tag
	end

	def self.destroy_tag(tag_id)
	  	tag = Tag.find(tag_id)
	  	tag.destroy
	end

end
