class Job < ApplicationRecord
  has_one :employer
  has_and_belongs_to_many :candidates

  def employer_name
    Employer.find(self.employer_id).name
  end

end
