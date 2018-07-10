require 'rails_helper'

describe 'user visits student edit' do
  it 'should be able to edit a student' do
    student = Student.create!(name: 'Petey')

    visit "students/#{student.id}/edit"

    fill_in 'student[name]', with: 'Heidi'

    click_on 'Update Student'

    expect(current_path).to eq("/students/#{student.id}")
    expect(page).to_not have_content("Name: #{student.name}")
    expect(page).to have_content("Name: Heidi")
  end
end
