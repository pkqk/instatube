class FormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options={})
    error = @object.errors.on(method) if @object
    classes = []
    classes << 'error' if error
    @template.content_tag(:p, :class => classes.join(' ')) do
      [
        label(method),
        super,
        (@template.content_tag(:span, error, :class => 'message') if error)
      ].compact.inject(&:+)
    end
  end
end