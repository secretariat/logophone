class Logo < ActiveRecord::Base
	belongs_to :user
  attr_accessible :first_name, :last_name, :logo_files, :phone
end
