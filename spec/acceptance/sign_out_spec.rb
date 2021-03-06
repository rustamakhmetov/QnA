require_relative 'acceptance_helper'

feature "User sign out", %q{
  In order to be able to finish the work with the system
  As an authenticated user
  I want to be able to sign out
} do

  given(:user) do
    create(:user)
  end

  scenario 'Registered user try to sign out' do
    sign_in(user)
    visit questions_path
    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sign out' do
    visit questions_path
    expect(page).to_not have_content 'Log out'
  end
end