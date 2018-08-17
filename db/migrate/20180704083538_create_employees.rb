class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.integer :office_id
      t.integer :company_id
      t.timestamps
    end
  end
end
