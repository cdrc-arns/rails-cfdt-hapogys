class UploadFile < ApplicationRecord
  mount_uploader :file, FileUploader
  mount_uploader :file_two, FileUploader
  mount_uploader :file_three, FileUploader

end
