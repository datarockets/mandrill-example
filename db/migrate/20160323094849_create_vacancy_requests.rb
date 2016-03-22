class CreateVacancyRequests < ActiveRecord::Migration
  def change
    create_table :vacancy_requests do |t|
      t.references :vacancy, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
