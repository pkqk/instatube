class Video < ActiveRecord::Base
  belongs_to :user
  
  def source
    URI.parse(source_url)
  end
  
  def domain
    source.host
  end

  def as_json(options=nil)
    attributes.slice('source_url', 'created_at').to_json(options)
  end
  
  def renderer
    if domain =~ /youtube.com$/
      YoutubeRenderer.new(self)
    else
      BaseRenderer.new(self)
    end
  end
end