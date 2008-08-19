# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def user_logged_in?
    session[:user_id]
  end
  
  def faq_categories
    FaqCategory.find :all , :order => :name 
  end
  
  def study_cases
    StudyCase.find :all , :order => :name 
  end
  
  #hack to get polymorphic routes working properly
  def object_comments_path(ob)
    eval(ob.class.to_s.downcase+'_'+'comments_path'+"(#{ob.id})") 
  end
  
  
  def growl_notification
    if msg = flash[:error] || flash[:notice] 
      javascript_tag "window.onload=function() { Growl.Smoke({ title: \"Mensagem do Portal UCA\", text: \"<h6 style='color:#fff;font-size:90%;'>"+msg+"</h6>\", duration: 5.0 }); }"
    end
  end
  
  def link_image_back(link)
    link_to(image_tag("back.png", :border => 0, :alt => 'Voltar', :title => 'voltar'), link)
  end
  
  
end
