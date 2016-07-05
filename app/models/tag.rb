class Tag < ActiveRecord::Base

	validates :slug, uniqueness: { :message => " This slug already exists" }
	validates :tag_name, presence: { :message => " This value is required" }

end
