class CreateTrials < ActiveRecord::Migration
  def self.up
    create_table :trials do |t|
      t.references  :session,                   :null => false
      t.references  :receiver,                  :null => false
      t.integer     :sender_selection_time
      t.integer     :receiver_response_time
      t.references  :sender_selected_sample,    :null => false
      t.references  :receiver_selected_sample,  :null => false
      t.boolean     :hit

      t.timestamps
    end
  end

  def self.down
    drop_table :trials
  end
end