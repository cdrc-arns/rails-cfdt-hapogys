class Join < ApplicationRecord
  belongs_to :user
  mount_uploader :file, FileUploader
end