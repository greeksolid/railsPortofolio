class AddProjectIdToProjectImages < ActiveRecord::Migration
  def change
  	add_column :project_images, :project_id, :integer
  end
end
