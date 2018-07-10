require 'rails_helper'

describe 'user visits course show' do
  it 'should see the course name all students in that course' do
    course = Course.create!(title: 'Mod2')
    student1 = course.students.create!(name: 'Petey')
    student2 = course.students.create!(name: 'Heidi')

    visit "courses/#{course.id}"

    expect(page).to have_content(course.title)
    expect(page).to have_content(student1.name)
    expect(page).to have_content(student1.name)
  end
end
