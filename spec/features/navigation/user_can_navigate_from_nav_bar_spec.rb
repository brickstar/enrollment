require 'rails_helper'

describe 'user visits any page' do
  it 'should see link to see all students or create a student' do
    student = Student.create(name: 'Petey')

    visit student_path(student)

    within '#navigation' do
      click_on 'See All Students'
    end

    expect(current_path).to eq(students_path)

    visit edit_student_path(student)

    within '#navigation' do
      click_on 'Create a Student'
    end

    expect(current_path).to eq(new_student_path)
  end
end
