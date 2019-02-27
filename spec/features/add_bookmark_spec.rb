feature 'Adding a bookmark to our list' do
  scenario 'Should display bookmark' do
    visit '/bookmarks'
    fill_in('title', with: 'Github')
    fill_in('url', with: 'https://github.com/')

    click_button 'Submit'

    url = page.find('.bookmark')[0][:href]
    expect(url).to eq 'https://github.com/'
  end
end
