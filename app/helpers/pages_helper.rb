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
  
  def link_image_page_edit(text=nil, link=nil)  
    link_to(image_tag('page_edit.png', :border => 0, :alt => 'Editar', :title => 'Editar')+text, link)
  end
  
  def tree_ul(acts_as_tree_set, init=true, &block)
    if acts_as_tree_set.size > 0
      ret = '<ul>'
      acts_as_tree_set.collect do |item|
        next if item.parent_id && init
        ret += '<li>'
        ret += yield item
        ret += tree_ul(item.children, false, &block) if item.children.size > 0
        ret += '</li>'
      end
      ret += '</ul>'
    end
  end
  
  def show_pages_tree
    tree_ul(@study_case.pages) {|item| show_truncate_permalink(item)    }
  end
  
end
