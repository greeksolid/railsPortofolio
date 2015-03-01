class CreateProjectPictures < ActiveRecord::Migration
  def change
    create_table :project_pictures do |t|
      t.string :image
      t.integer :project_id

      t.timestamps
    end

    add_index :project_pictures, :project_id
  end
end
