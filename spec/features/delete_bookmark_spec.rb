feature 'Deleting a bookmark from our list' do
  scenario 'Should display bookmark' do
    create_bookmark('http://www.makersacademy.com', 'Makers')
    create_bookmark('http://www.destroyallsoftware.com', 'DAS')
    add_bookmark
    click_button 'Remove Github'
    expect(page).not_to have_button('Remove Github')
    expect(page).to have_content "Makers"
  end
end