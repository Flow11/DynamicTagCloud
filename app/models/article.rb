# == Schema Information
# Schema version: 20101223132714
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
	has_and_belongs_to_many :tags
end
