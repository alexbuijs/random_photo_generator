# == Schema Information
# Schema version: 20090614160335
#
# Table name: trials
#
#  id                             :integer         not null, primary key
#  sender_selection_time          :integer(0)      not null
#  receiver_response_time         :integer(0)      not null
#  hit                            :boolean         not null
#  session_id                     :integer(0)      not null
#  receiver_id                    :integer(0)      not null
#  sender_selected_sample_id      :integer(0)      not null
#  receiver_selected_sample_id_id :integer(0)      not null
#  created_at                     :datetime        not null
#  updated_at                     :datetime        not null
#

class Trial < ActiveRecord::Base
  belongs_to :session
  belongs_to :receiver, :class_name => "User"
  belongs_to :sender_selected_sample, :class_name => "Sample"
  belongs_to :receiver_selected_sample, :class_name => "Sample"
  has_and_belongs_to_many :receivers
end
