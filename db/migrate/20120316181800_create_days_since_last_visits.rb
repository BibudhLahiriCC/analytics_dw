class CreateDaysSinceLastVisits < ActiveRecord::Migration
  def change
    create_table :days_since_last_visits do |t|

      t.timestamps
    end
  end
end
