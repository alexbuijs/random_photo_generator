# == Schema Information
# Schema version: 20090614160335
#
# Table name: analyses
#
#  id                    :integer         not null, primary key
#  session_id            :integer(0)      not null
#  sample_size           :integer(0)      not null
#  trials                :integer(0)      not null
#  hits                  :integer(0)      not null
#  accumulated_deviation :decimal(, )     not null
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#

class Analysis < ActiveRecord::Base
  belongs_to :session

  validates_presence_of :session
  validates_length_of :sample_size, :within => 2..20
  validates_length_of :trials, :within => 1..100
  validates_length_of :hits, :within => 0..100

  before_validation :perform_analysis

  private

  def perform_analysis
    self.sample_size = session.sample_size
    self.trials = session.trials.size
    self.hits = session.trials.select {|trial| trial.hit == true}.size
    self.accumulated_deviation = (trials.to_f / hits.to_f) - (1 / sample_size.to_f) if sample_size > 0 && trials > 0 && hits > 0
    return true
  end
end
