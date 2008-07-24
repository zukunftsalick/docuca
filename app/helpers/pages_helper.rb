module PagesHelper
  
  def show_permalink(page)
    url =  '/study_cases/'+page.study_case.to_param+'/pages/'
    if page.permalink.nil?
      url += page.id.to_s
    else
      url += page.permalink
    end
  end
  
  def show_truncate_permalink(page)
    "<a href='#{show_permalink(page)}' title='#{page.title}'>#{truncate(page.title, 140)}</a>" 
  end
end
