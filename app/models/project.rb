class Project < ActiveRecord::Base
	belongs_to :category
	has_one :project_picture, dependent: :destroy
	has_many :project_images, dependent: :destroy
	has_and_belongs_to_many :technologies

	accepts_nested_attributes_for :project_images
end
