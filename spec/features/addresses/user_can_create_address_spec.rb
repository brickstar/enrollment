require 'rails_helper'

describe 'user visits students/:id/addresses/new' do
  it 'can create a new address' do
    student = Student.create!(name: 'Petey')
    description = 'office'
    street = '9th'
    city = 'Denver'
    state = 'CO'
    zip_code = 89191

    visit new_student_address_path(student)

    fill_in 'address[description]', with: description
    fill_in 'address[street]', with: street
    fill_in 'address[city]', with: city
    fill_in 'address[state]', with: state
    fill_in 'address[zip_code]', with: zip_code

    click_button 'Create Address'

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("Description: #{student.addresses.last.description}")
    expect(page).to have_content("Street: #{student.addresses.last.street}")
    expect(page).to have_content("City: #{student.addresses.last.city}")
    expect(page).to have_content("State: #{student.addresses.last.state}")
    expect(page).to have_content("Zip: #{student.addresses.last.zip_code}")
    expect(Address.all.length).to eq(1)
  end
end
