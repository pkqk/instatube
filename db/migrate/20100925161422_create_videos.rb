class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos, :force => true do |t|
      t.belongs_to :user
      t.string :source_url
      t.text :code
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
