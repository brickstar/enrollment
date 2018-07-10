require 'rails_helper'

describe 'user visits students new' do
  it 'should be able to create a student' do

    visit '/students/new'

    fill_in 'student[name]', with: 'Petey'

    click_on 'Create Student'

    expect(current_path).to eq("/students/#{Student.last.id}")
    expect(page).to have_content("Name: #{Student.last.name}")
    expect(Student.all.length).to eq(1)
  end
end
