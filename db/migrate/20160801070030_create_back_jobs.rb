class CreateBackJobs < ActiveRecord::Migration
  def change
    create_table :back_jobs do |t|
      t.string :uri_str, presence: true
      t.string :json_params
      t.text :response_body

      t.timestamps null: false
    end
  end
end
