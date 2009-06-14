class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :sender_id
      t.integer :max_sender_selection_time,   :null => false, :default => 10
      t.integer :sender_focus_time,           :null => false, :default => 30
      t.integer :max_receiver_response_time,  :null => false, :default => 30
      t.integer :recovery_time,               :null => false, :default => 15
      t.integer :trial_size,                   :null => false
      t.integer :sample_size,                  :null => false
      t.string  :genre
      t.string  :type
      t.float   :genre_type_ratio
      t.boolean :sampling_with_replacement,   :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end