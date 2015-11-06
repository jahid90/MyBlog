class Comment < ActiveRecord::Base
	belongs_to :blog_entry

	validates :author, presence: true
	validates :content, presence: true
end
