# == Schema Information
# Schema version: 20101223154012
#
# Table name: tags
#
#  id         :integer         primary key
#  name       :string(255)
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
	belongs_to :article
	has_many :links
end
