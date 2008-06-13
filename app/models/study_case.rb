class StudyCase < ActiveRecord::Base
  has_many :events
  belongs_to :user
  
  has_many :comments, :as => :commentary
  
  #types definition can be found in environment.rb
  def self.types
    return STUDY_CASE_TYPES
  end
end
