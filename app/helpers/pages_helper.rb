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
  
  def link_image_page_edit(link)
    link_to(image_tag('page_edit.png', :border => 0, :alt => 'Editar', :title => 'Editar'), link)
  end
  
  def print_node(node, result='',count=0)
    if (node.children.size>0)
      result += "<div style='padding-left:"+count.to_s+"px'>" 
      result += show_truncate_permalink(node) 
      result += link_image_page_edit edit_object_path(node) unless !logged_in?
      result += "</div>"
      
      node.children.each do |child|
        print_node(child, result,count+=15)
      end
    end
    return result
  end
end
