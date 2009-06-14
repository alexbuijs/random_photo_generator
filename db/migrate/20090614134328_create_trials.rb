class CreateTrials < ActiveRecord::Migration
  def self.up
    create_table :trials do |t|
      t.integer :sender_selection_time
      t.integer :receiver_response_time
      t.boolean :hit

      t.references :session
      t.references :receiver
      t.references :sender_selected_sample
      t.references :receiver_selected_sample_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trials
  end
end