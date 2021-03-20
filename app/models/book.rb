class Book < ApplicationRecord
  has_one_attached :photo
  has_one_attached :file
end
