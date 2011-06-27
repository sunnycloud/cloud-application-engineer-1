class CreateGraphPoints < ActiveRecord::Migration
  def self.up
    create_table :graph_points do |t|
      t.float :x_coord
      t.float :y_coord

      t.timestamps
    end
  end

  def self.down
    drop_table :graph_points
  end
end
