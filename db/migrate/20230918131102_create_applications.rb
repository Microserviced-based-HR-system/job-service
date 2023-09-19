class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :job, null: false, foreign_key: true
      t.bigint :candidate_id, null: false
      t.datetime :submitted_at
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
