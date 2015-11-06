class BlogEntry < ActiveRecord::Base
	has_many :comments

	validates :title, presence: true
	validates :body, presence: true
end
