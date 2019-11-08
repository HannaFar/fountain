class Job < ApplicationRecord
  has_one :employer
  has_and_belongs_to_many :candidates
  # validates :title, presence: true, :message => "can't be empty"
  validates_presence_of :title, message: 'You must provide the title of book.'

  def employer_name
    Employer.find(self.employer_id).name
  end

end
