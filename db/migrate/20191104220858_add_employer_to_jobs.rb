class AddEmployerToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :employer, foreign_key: true
  end
end
