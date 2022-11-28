class Join < ApplicationRecord
  belongs_to :user
  mount_uploader :file, FileUploader
  mount_uploader :file_two, FileUploader
end
