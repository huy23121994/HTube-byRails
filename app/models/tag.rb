class Tag < ActiveRecord::Base

	validates :slug, uniqueness: { :message => " already exists" }
	validates :tag_name, presence: { :message => " is required" }

end
