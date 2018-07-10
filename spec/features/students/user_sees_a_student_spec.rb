require 'rails_helper'

describe 'user visits students show' do
  it 'should see the name of a student' do
    student = Student.create!(name: 'Petey')

    visit student_path(student)

    expect(page).to have_content("Name: #{student.name}")
  end
end
