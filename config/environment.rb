# Load the rails application
require File.expand_path('../application', __FILE__)
require 'form_builder'

# Initialize the rails application
Instatube::Application.initialize!
Instatube::Application.configure do
  config.action_view.default_form_builder = FormBuilder
  config.action_view.field_error_proc = Proc.new { |html_tag,instance| html_tag }
end
