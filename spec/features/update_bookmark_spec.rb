feature 'Updating a bookmark from our list' do
  scenario 'Should display the updated bookmark' do
    create_bookmark('http://www.makersacademy.com', 'Makers')
    create_bookmark('http://www.destroyallsoftware.com', 'DAS')
    add_bookmark
    click_button 'Update Github'
    fill_in('title', with: 'Github_updated')
    fill_in('url', with: 'https://github.com/')
    click_button 'Submit'
    expect(page).to have_content "Github_updated"
    expect(page).to have_content "Makers"
  end
end
