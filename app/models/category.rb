class Category < ActiveRecord::Base

	has_many :posts, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy

	validates :slug, uniqueness: { :message => " already exists" }
	validates :category, presence: { :message => " is required" }

	def self.get_all_categories
		self.all
	end

	def self.get_category(category_id)
		self.find(category_id)
	end

	def self.update_category(category_id,data_update)
		category = self.find(category_id)
		category.category = data_update['category']
		category.slug = data_update['slug']
		category.save

		return category
	end

	def self.create_category(data_create)
		category = self.new
		category.category = data_create['category']
		category.slug = data_create['slug']
		category.save

		return category
	end

	def self.destroy_category(category_id)
		category = self.find(category_id)
		category.destroy

		return category
	end
end
