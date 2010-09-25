module ApplicationHelper
  def title_or_default(&block)
    if (title = yield).present?
     "#{title.strip} | Instatube"
    else
      "Instatube"
    end
  end
end
