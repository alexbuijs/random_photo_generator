# == Schema Information
# Schema version: 20090614160335
#
# Table name: samples
#
#  id           :integer         not null, primary key
#  description  :string          not null
#  size         :integer(0)      not null
#  content_type :string(0)       not null
#  filename     :string(0)       not null
#  height       :integer(0)      not null
#  width        :integer(0)      not null
#  parent_id    :integer(0)      not null
#  thumbnail    :string(0)       not null
#  db_file_id   :integer(0)      not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Sample < ActiveRecord::Base
  has_attachment :max_size => 5.megabytes, :thumbnails => { :thumb => '90x90!' }
end
