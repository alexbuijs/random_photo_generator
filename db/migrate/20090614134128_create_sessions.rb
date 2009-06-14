class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :sender_id
      t.integer :max_sender_selection_time
      t.integer :sender_focus_time
      t.integer :max_receiver_response_time
      t.integer :recovery_time
      t.integer :trial_size
      t.integer :sample_size
      t.string :genre
      t.string :type
      t.float :genre_type_ratio
      t.boolean :sampling_with_replacement

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end