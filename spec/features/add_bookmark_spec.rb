feature 'Adding a bookmark to our list' do
  scenario 'Add a bookmark' do
    visit ('/bookmarks')
    fill_in('url', with: 'https://github.com/')
    click_button 'Submit'
    expect(page.find_by_id('bookmark_list')).to have_content 'https://github.com/'
  end
end