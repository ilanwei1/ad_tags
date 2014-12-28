class AdTag < ActiveRecord::Base
  validates :ip, presence: true
end
