module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if !current_employer.nil?
      puts 'employer'

    elsif !current_candidate.nil?
      puts 'candidate'
    end
  end
end
