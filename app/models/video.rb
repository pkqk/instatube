class Video < ActiveRecord::Base
  belongs_to :user

  def as_json(options=nil)
    attributes.slice('source_url', 'created_at').to_json(options)
  end
end