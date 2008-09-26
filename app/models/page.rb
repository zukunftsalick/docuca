class Page < ActiveRecord::Base
  before_save :check_event_dates
  acts_as_tree :order => "title"
  
  belongs_to :study_case
  validates_presence_of :title, :message => "não pode ser em branco."
  validates_presence_of :content, :message => "não pode ser em branco."
  validates_uniqueness_of :permalink, :message => "deve ser único."

  validates_presence_of :event_start, :message => "não pode ser em branco.", :if => proc { |obj| !obj.event? }

  
  protected
  def check_event_dates
    if !self.event
      self.event_start, self.event_end = nil
    end
  end

end
