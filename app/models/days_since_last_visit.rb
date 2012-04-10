class DaysSinceLastVisit < ActiveRecord::Base

  def readonly?
      true
  end

  class << self
  def histogram(gender, age_group)

   where_clause = String.new
   gender_clause = String.new
   age_clause = String.new
   i_age_group = age_group.to_i
   #If age_group is nil, i_age_group becomes 0

   if "Male".eql?(gender) or "Female".eql?(gender)
     gender_clause = " and dim_people.gender = '#{gender}'"
   end
   if (i_age_group > 0)
      case i_age_group
        when 1
          age_clause = ' and age_rounded_in_years between 0 and 1'
        when 2
          age_clause = ' and age_rounded_in_years between 2 and 5'
        when 3
          age_clause = ' and age_rounded_in_years between 6 and 12'
        when 4
          age_clause = ' and age_rounded_in_years between 13 and 16'
        when 5
          age_clause = ' and age_rounded_in_years = 17'
        when 6
          age_clause = ' and age_rounded_in_years >= 18'
      end
   end
   where_clause = "#{gender_clause}" << "#{age_clause}"
   days_since_last_visit_sql = <<-SQL
     select fct_visits.days_since_last_visit
     from fct_visits, fct_removal_episodes, dim_people
     where fct_visits.child_id = dim_people.person_id
     and fct_removal_episodes.child_id = dim_people.person_id
     and fct_removal_episodes.end_date > current_date
     #{where_clause}
   SQL

   days_snc_lst_vst = ActiveRecord::Base.connection.select_rows(days_since_last_visit_sql)
   days_snc_lst_vst_rtrn = days_snc_lst_vst.collect{|singleton_array| singleton_array[0].to_i}
  end
  end
end
