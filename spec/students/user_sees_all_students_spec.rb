require 'rails_helper'

describe 'user visits students index' do
  it 'should see a list of student names' do
    student1 = Student.create(name: 'Petey')
    student2 = Student.create(name: 'Heidi')

    visit '/students'

    expect(page).to have_content("Name: #{student1.name}")
    expect(page).to have_content("Name: #{student2.name}")
  end
end
