class AddContactReferenceToFileUpload < ActiveRecord::Migration[7.0]
  change_table :file_uploads do |t|
    t.references :contact, null: false, foreign_key: true
  end
end
