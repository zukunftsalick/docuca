module StudyCasesHelper
  def link_image_study_case_edit(link, text=nil)
    link_to(image_tag("application_form_edit.png", :border => 0, :alt => 'Editar', :title => 'Editar')+"\n"+text.to_s, link)
  end
end
