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

  before_create :perform_analysis

  def perform_analysis
    self.trials = session.trials.size
    self.hits = session.trials.select {|trial| trial.hit == true}.size
    self.sample_size = session.sample_size
    self.accumulated_deviation = (trials.to_f / hits.to_f) - (1 / sample_size.to_f)
  end
end
