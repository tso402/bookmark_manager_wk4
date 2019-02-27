def add_bookmark
    visit '/bookmarks'
    fill_in('title', with: 'Github')
    fill_in('url', with: 'https://github.com/')

    click_button 'Submit'
end
