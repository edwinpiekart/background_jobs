class AddExceptionsToBackJobs < ActiveRecord::Migration
  def change
    add_column :back_jobs, :exceptions, :string, default: '', after: :retries
  end
end
