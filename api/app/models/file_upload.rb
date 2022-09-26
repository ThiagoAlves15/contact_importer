class FileUpload < ApplicationRecord
  enum status: { waiting: 0, processing: 1, failed: 2, finished: 3 }

  has_many :contacts, dependent: :destroy
end
