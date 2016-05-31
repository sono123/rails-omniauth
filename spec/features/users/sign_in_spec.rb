
feature 'Sign in', :omniauth do

  scenario "user can sign in with valid account" do
    signin
    expect(page).to have_content("Sign Out")
  end

  scenario 'user cannot sign in with invalid account' do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    visit root_path
    expect(page).to have_content("Sign In")
    click_link "Sign In"
    expect(page).to have_content('Authentication error')
  end

end

