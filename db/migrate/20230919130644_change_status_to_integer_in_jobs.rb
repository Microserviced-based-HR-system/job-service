class ChangeStatusToIntegerInJobs < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :status, :integer, default: 0, null: false, using: "status::integer"
  end
end
