class CreateDimPeople < ActiveRecord::Migration
  def change
    create_table :dim_people do |t|

      t.timestamps
    end
  end
end
