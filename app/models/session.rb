# == Schema Information
# Schema version: 20090614160335
#
# Table name: sessions
#
#  id                         :integer         not null, primary key
#  sender_id                  :integer(0)      not null
#  max_sender_selection_time  :integer(0)      default(10), not null
#  sender_focus_time          :integer(0)      default(30), not null
#  max_receiver_response_time :integer(0)      default(30), not null
#  recovery_time              :integer(0)      default(15), not null
#  trial_size                 :integer(0)      not null
#  sample_size                :integer(0)      not null
#  genre                      :string(0)       not null
#  type                       :string(0)       not null
#  genre_type_ratio           :decimal(, )     not null
#  sampling_with_replacement  :boolean         default(TRUE), not null
#  created_at                 :datetime        not null
#  updated_at                 :datetime        not null
#

class Session < ActiveRecord::Base
  has_many :trials
  belongs_to :sender, :class_name => "User"
  has_many :receivers, :through => :trials
  has_one :analysis

  validates_presence_of :sender
  validates_length_of :max_sender_selection_time, :within => 1..300
  validates_length_of :sender_focus_time, :within => 1..300
  validates_length_of :max_receiver_response_time, :within => 1..300
  validates_length_of :recovery_time, :within => 1..300
  validates_length_of :trial_size, :within => 1..100
  validates_length_of :sample_size, :within => 2..20
end
