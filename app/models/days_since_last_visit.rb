class DaysSinceLastVisit < ActiveRecord::Base

  def readonly?
      true
  end

  class << self
  def histogram(gender)
   puts "gender = " + gender
   days_since_last_visit_sql = <<-SQL
     select fct_visits.days_since_last_visit
     from fct_visits, dim_people
     where fct_visits.child_id = dim_people.person_id
     and dim_people.gender = 'Male'
     order by fct_visits.child_id
   SQL
   days_snc_lst_vst = ActiveRecord::Base.connection.select_rows(days_since_last_visit_sql)
   days_snc_lst_vst_rtrn = days_snc_lst_vst.collect{|singleton_array| singleton_array[0].to_i}
  end
  end
end
