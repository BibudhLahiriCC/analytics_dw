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
  end #end histogram

  #Returns the number of children in placement on any given date
  def n_children_in_placement(date)
    n_chldrn_in_plcmnt = <<-SQL
      select count(*) from fct_removal_episodes
      where start_date <= '#{date}'
      and (end_date is null or end_date >= '#{date}')
    SQL
    n_children = ActiveRecord::Base.connection.select_value(n_chldrn_in_plcmnt)
    n_children.to_i
  end

  #Number of children who where in placement on a given date,
  #and had not had a visit in last n days, starting from the given date
  def n_children_no_visit_n_days(date, n)
    statement = <<-SQL
     select count(r.child_id)
     from fct_removal_episodes r, fct_visits v
     where r.child_id = v.child_id
     and r.start_date <= '#{date}'
     and (r.end_date is null or r.end_date >= '#{date}')
     and (date '#{date}' - to_date(replace(quote_literal(v.year_last_visit), E'\\'', '') ||
                                lpad(replace(quote_literal(v.month_last_visit), E'\\'', ''), 2, '0') ||
                                lpad(replace(quote_literal(v.day_last_visit), E'\\'', ''), 2, '0'),
                                'YYYYMMDD')) >= #{n}
    SQL
    n_chldrn_no_vst_n_days =
      ActiveRecord::Base.connection.select_value(statement)
  end

  def f_n_t(start_window, end_window, slot_length, n)
    query_date = Date.strptime(start_window, '%Y-%m-%d')
    window_end_date = Date.strptime(end_window, '%Y-%m-%d')
    #For each time-point t as key, store f(n,t) as value
    return_hash = Hash.new
    while (query_date < window_end_date) do
     n_chldrn_in_plcmnt = n_children_in_placement(query_date)
     if (n_chldrn_in_plcmnt > 0)
       n_chldrn_no_vst_n_days = n_children_no_visit_n_days(query_date, n)
       puts "query_date = #{query_date}, n_chldrn_in_plcmnt =
             #{n_chldrn_in_plcmnt}, n_chldrn_no_vst_n_days =
             #{n_chldrn_no_vst_n_days}"
       return_hash[query_date] =
         (n_chldrn_no_vst_n_days.to_f/n_chldrn_in_plcmnt).round(3)
     else
       return_hash[query_date] = 0
     end #end if
     query_date += slot_length.days
    end #end while
    return_hash
  end
  end #end of static methods

end
