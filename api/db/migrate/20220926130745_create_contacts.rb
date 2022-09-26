class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.date :date_of_birth
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :file_upload, null: false, foreign_key: true

      t.timestamps
    end
  end
end
