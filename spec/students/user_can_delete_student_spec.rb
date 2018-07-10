require 'rails_helper'

describe 'user visits student index' do
  it 'should be able to delete a student' do
    student1 = Student.create!(name: 'Petey')
    student2 = Student.create!(name: 'Matt')
    student3 = Student.create!(name: 'Heidi')

    visit "/students"

    within "#student-#{student2.id}" do
      click_on 'Delete'
    end

    expect(current_path).to eq('/students')
    expect(page).to_not have_content(student2.name)
    expect(page).to have_content(student1.name)
    expect(page).to have_content(student3.name)
  end
end
