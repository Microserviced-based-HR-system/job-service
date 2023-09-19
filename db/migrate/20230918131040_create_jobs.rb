class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :job_type, null: false, foreign_key: true
      t.bigint :company_id, null: false
      t.string :title
      t.text :description
      t.string :requirements
      t.string :expired_date
      t.string :status
      t.string :location
      t.integer :no_of_vacancies

      t.timestamps
    end
  end
end
