module ApplicationHelper

  def gender
    gender =  params[:gender]
    if gender.nil?
      gender = 'All'
    end
    gender
  end

  def age_group
    #If params[:age_group].is nil, 0 will be returned.
    params[:age_group].to_i
  end

end
