module ApplicationHelper
  def title_or_default(&block)
    if (title = yield).present?
     "#{title.strip} | Instatube"
    else
      "Instatube"
    end
  end
  
  def default_title
    @title || "#{params[:controller].singularize}[#{params[:action]}] || Instatube"
  end
end
