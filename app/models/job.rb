class Job < ApplicationRecord
  has_one :employer
  has_and_belongs_to_many :candidates

end
