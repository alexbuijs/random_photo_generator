# == Schema Information
# Schema version: 20090614160335
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  login              :string(0)       not null
#  crypted_password   :string(0)       not null
#  password_salt      :string(0)       not null
#  persistence_token  :string(0)       not null
#  login_count        :integer(0)      default(0), not null
#  failed_login_count :integer(0)      default(0), not null
#  current_login_at   :datetime        not null
#  last_login_at      :datetime        not null
#  current_login_ip   :string(0)       not null
#  last_login_ip      :string(0)       not null
#  role               :integer(0)      not null
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class User < ActiveRecord::Base
  acts_as_authentic

  ROLES = {
    :sender => 0,
    :receiver => 1,
    :researcher => 3
  }

  # Define dynamic methods for each user role
  ROLES.keys.each { |role| self.send(:define_method, "#{role.to_s}?") { role_name == role.to_s }}
  ROLES.keys.each do |role|
    named_scope role.to_s.pluralize,
      :conditions => {:role => ROLES[role]}
  end

  def role_name
    ROLES.index(role).to_s
  end
end
