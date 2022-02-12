require 'rails_helper'

RSpec.describe Category, type: :model do
  it "should have a name" do
    category = Category.new(
      name: '',
      description: 'this is the description'
    )
    
    expect(category).to_not be_valid
    category.name = 'name'
    expect(category).to be_valid
  end

    it "can have or have no description" do
      category = Category.new(
        name: 'name',
        description: ''
      )
      
      expect(category).to be_valid
      category.description = 'description'
      expect(category).to be_valid
    end
  
end
