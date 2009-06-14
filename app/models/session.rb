# == Schema Information
# Schema version: 20090614160335
#
# Table name: sessions
#
#  id                         :integer         not null, primary key
#  sender_id                  :integer(0)      not null
#  max_sender_selection_time  :integer(0)      not null
#  sender_focus_time          :integer(0)      not null
#  max_receiver_response_time :integer(0)      not null
#  recovery_time              :integer(0)      not null
#  trial_size                 :integer(0)      not null
#  sample_size                :integer(0)      not null
#  genre                      :string(0)       not null
#  type                       :string(0)       not null
#  genre_type_ratio           :decimal(, )     not null
#  sampling_with_replacement  :boolean         not null
#  created_at                 :datetime        not null
#  updated_at                 :datetime        not null
#

class Session < ActiveRecord::Base
  has_many :trials
  belongs_to :sender, :class_name => "User"
  has_many :receivers, :through => :trials
  has_one :analysis
end
