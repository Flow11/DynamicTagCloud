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
	has_many :articles, :through => :article_id
	has_many :links
end
