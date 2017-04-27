class Video < ApplicationRecord
  attr_accessor :media_cache
  mount_uploader :media, VideoUploader
  extend FriendlyId
  friendly_id :title, use: :slugged
  process_in_background :media

  def video_screenshot
    screenshot_path = Rails.root+"/app/assets/images/screenshots/#{self.slug}_#{self.id}.jpg"
    if FileTest.exists?(screenshot_path)
      @screenshot = screenshot_path
    else
      video_file = FFMPEG::Movie.new("#{Rails.root}/public"+self.video.url(:mp4))
      @screenshot = video_file.screenshot("#{screenshot_path}")
    end
	end
end
