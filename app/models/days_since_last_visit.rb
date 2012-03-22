class DaysSinceLastVisit < ActiveRecord::Base

  def readonly?
      true
  end

  class << self
  def histogram(gender)

   where_clause = String.new
   if "Male".eql?(gender) or "Female".eql?(gender)
     where_clause = " and dim_people.gender = '#{gender}'"
   end
   days_since_last_visit_sql = <<-SQL
     select fct_visits.days_since_last_visit
     from fct_visits, dim_people
     where fct_visits.child_id = dim_people.person_id
     #{where_clause}
   SQL

   days_snc_lst_vst = ActiveRecord::Base.connection.select_rows(days_since_last_visit_sql)
   days_snc_lst_vst_rtrn = days_snc_lst_vst.collect{|singleton_array| singleton_array[0].to_i}
  end
  end
end
