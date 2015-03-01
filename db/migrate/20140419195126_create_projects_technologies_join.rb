class CreateProjectsTechnologiesJoin < ActiveRecord::Migration
  def change
    create_table :projects_technologies, :id => false do |t|
    	t.integer "project_id"
    	t.integer "technology_id"
    end
    add_index :projects_technologies, ["project_id", "technology_id"]
  end
end
