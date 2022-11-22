class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  mount_uploader :file, FileUploader
end
