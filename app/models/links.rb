# == Schema Information
# Schema version: 20101223155804
#
# Table name: links
#
#  id         :integer         not null, primary key
#  id_tag     :integer
#  occurrence :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Links < ActiveRecord::Base
	belongs_to :tag
end
