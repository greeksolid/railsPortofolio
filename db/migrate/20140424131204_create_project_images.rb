class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|

      t.timestamps
    end
  end
end
