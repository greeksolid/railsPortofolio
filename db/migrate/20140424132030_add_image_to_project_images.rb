class AddImageToProjectImages < ActiveRecord::Migration
  def change
    add_column :project_images, :image, :string
  end
end
