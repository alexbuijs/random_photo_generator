class CreateAnalyses < ActiveRecord::Migration
  def self.up
    create_table :analyses do |t|
      t.references  :session,             :null => false
      t.integer     :sample_size
      t.integer     :trials
      t.integer     :hits
      t.float       :accumulated_deviation

      t.timestamps
    end
  end

  def self.down
    drop_table :analyses
  end
end