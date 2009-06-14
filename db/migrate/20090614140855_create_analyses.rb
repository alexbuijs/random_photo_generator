class CreateAnalyses < ActiveRecord::Migration
  def self.up
    create_table :analyses do |t|
      t.integer :trials
      t.integer :hits
      t.integer :sample_size
      t.float :accumulated_deviation

      t.references :session

      t.timestamps
    end
  end

  def self.down
    drop_table :analyses
  end
end