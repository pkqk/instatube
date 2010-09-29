require 'cgi'

class YoutubeRenderer < BaseRenderer
  
  def youtube_id
    CGI.parse(video.source.query).fetch('v',[]).first
  end
  
  def movie_url
    "http://www.youtube.com/v/#{youtube_id}"
  end

  def to_html
    # <object width="480" height="385">
    # <param name="movie" value="http://www.youtube.com/v/wRP6egIEABk?fs=1&amp;hl=en_GB"></param>
    # <param name="allowFullScreen" value="true"></param>
    # <param name="allowscriptaccess" value="always"></param>
    # <embed src="http://www.youtube.com/v/wRP6egIEABk?fs=1&amp;hl=en_GB" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="480" height="385"></embed>
    # </object>
    params_and_embed = [
      tag(:param, :name => 'movie', :value => movie_url),
      tag(:param, :name => 'allowFullScreen', :value => 'true'),
      tag(:param, :name => 'allowscriptaccess', :value => 'always'),
      tag(:embed, :src => movie_url,
        :type => "application/x-shockwave-flash",
        :allowscriptaccess => "always",
        :allowfullscreen => "true",
        :width => "480",
        :height => "385")
    ].reduce(&:safe_concat)
    content_tag_string(:object, params_and_embed, :width => 480, :height => 385)
  end
end