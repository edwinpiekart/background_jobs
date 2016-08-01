class AddRetriesToBackJobs < ActiveRecord::Migration
  def change
    add_column :back_jobs, :retries, :integer, default: 0, after: :json_params
  end
end
