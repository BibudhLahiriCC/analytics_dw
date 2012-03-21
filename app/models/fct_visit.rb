class FctVisit < ActiveRecord::Base
   #set_table_name "fct_visits"
   belongs_to :dim_person
end
