class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :metrics
  end
end
