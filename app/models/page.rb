class Page < ApplicationRecord

  #model asociation
  has_many :page_elements, dependent: :destroy

  #validations
  validates_presence_of :url
end
