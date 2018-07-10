require 'rails_helper'

describe 'user visits students show' do
  it 'should see a list of their courses' do
    student = Student.create!(name: 'Petey')
    course1 = student.courses.create!(title: 'awesome')
    course2 = student.courses.create!(title: 'radical')

    visit "/students/#{student.id}"

    expect(page).to have_content(course1.title)
    expect(page).to have_content(course2.title)
  end
end
