class CreateFctVisits < ActiveRecord::Migration
  def change
    create_table :fct_visits do |t|

      t.timestamps
    end
  end
end
