class FormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options={})
    @template.content_tag(:p) do
      label(method) + super
    end
  end
end