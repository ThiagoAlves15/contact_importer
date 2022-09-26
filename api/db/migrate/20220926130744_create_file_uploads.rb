class CreateFileUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :file_uploads do |t|
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
