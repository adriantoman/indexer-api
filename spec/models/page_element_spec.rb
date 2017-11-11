require 'rails_helper'

RSpec.describe PageElement, type: :model do
  it {should belong_to(:page)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:element_type)}
end
