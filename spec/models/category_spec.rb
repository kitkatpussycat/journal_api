require 'rails_helper'

RSpec.describe Category, type: :model do
  it "should have a name" do
    user = User.create(email: "email@email.com", password: 'password')
    category = Category.new(
      name: '',
      description: 'this is a description',
      user: user
    )

    expect(category).to_not be_valid
    category.name = 'this is a name'
    expect(category).to be_valid

  end

    it "can have or have no description" do
      user = User.create(email: "email@email.com", password: "password")
      category = Category.new(
        name: 'name',
        description: '',
        user: user
      )
      
      expect(category).to be_valid
      category.description = 'description'
      expect(category).to be_valid
    end
  
end
