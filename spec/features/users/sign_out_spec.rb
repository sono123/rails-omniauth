
feature 'Sign out', :omniauth do

  scenario 'user signs out successfully' do
    signin
    click_link 'Sign Out'
    expect(page).to have_content 'Signed Out'
  end

end
