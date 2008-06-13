class Event < ActiveRecord::Base
  belongs_to :study_case
  
  #validations
  validates_presence_of :user_id
  validates_presence_of :study_case_id
  validates_presence_of :start_date
  validates_presence_of :title
  
  

  
  
end
