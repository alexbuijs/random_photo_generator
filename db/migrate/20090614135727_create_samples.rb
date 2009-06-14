class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.text        :description

      # Colums used for attachment_fu
      t.integer     :size
      t.string      :content_type
      t.string      :filename
      t.integer     :height
      t.integer     :width
      t.integer     :parent_id
      t.string      :thumbnail
      t.references  :db_file

      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end