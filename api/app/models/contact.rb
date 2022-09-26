class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :file_uploads

  enum status: { success: 0, error: 1 }
end
