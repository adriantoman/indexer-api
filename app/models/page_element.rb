class PageElement < ApplicationRecord
  inheritance_column
  belongs_to :page
  validates_presence_of :content,:element_type


  ELEMENT_TYPE_MAPPING = {
      1 => 'h1',
      2 => 'h2',
      3 => 'h3',
      4 => 'link'
  }

  def element_type
    ELEMENT_TYPE_MAPPING[self[:element_type]]
  end

end



