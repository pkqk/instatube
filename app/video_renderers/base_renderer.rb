class BaseRenderer < Struct.new(:video)
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper

  def to_html
    link_to "source", video.source_url
  end
end