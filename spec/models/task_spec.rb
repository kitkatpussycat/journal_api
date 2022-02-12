require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should have a name' do
    c = FactoryBot.create(:category, name: 'name', description: '')
    t = Task.new(
      name: '',
      description: '',
      date: Date.today,
      category: c
    )
    expect(t).to_not be_valid
    t.name = "this is a name"
    expect(t).to be_valid
  end

  it "should have a date" do
    c = FactoryBot.create(:category, name: 'name', description: '')
    t = Task.new(
      name: 'name',
      description: '',
      date: '',
      category: c
    )

    expect(t).to_not be_valid
    t.date = Date.today
    expect(t).to be_valid
  end

  it "date should not be in the past" do
    c = FactoryBot.create(:category, name: 'name', description: '')
    t = Task.new(
      name: 'name',
      description: '',
      date: Date.new(2021, 12, 12),
      category: c
    )

    expect(t).to_not be_valid
    t.date = Date.today
    expect(t).to be_valid
    t.date = Date.new(2022, 12, 12)
    expect(t).to be_valid
  end
end