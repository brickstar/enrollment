require 'rails_helper'

describe 'user visits any page' do
  it 'should see link to see all students or create a student' do
    student = Student.create(name: 'Petey')

    visit "/students/#{student.id}"

    within '#navigation' do
      click_on 'See All Students'
    end

    expect(current_path).to eq(students_path)

    visit "/students/#{student.id}/edit"

    within '#navigation' do
      click_on 'Create a Student'
    end

    expect(current_path).to eq('/students/new')
  end
end
