class AdTag < ActiveRecord::Base
  validates :ip,:size,:name, presence: true
end
