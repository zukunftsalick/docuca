class HomeController < ResourceController::Base
  layout 'default'
  
  def index
    @featured_study_cases = StudyCase.find(:all, :limit => 5)
    client = YouTubeG::Client.new
    @youtube_videos = client.videos_by(:user => 'lecufrgs', :per_page => 5, :limit => 5)
        
  end
  
  def team
    
  end

end
