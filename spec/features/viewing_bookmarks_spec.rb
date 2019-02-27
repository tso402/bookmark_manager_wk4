feature "index page for bookmark manager" do
  scenario "basic index page" do
    visit '/'
    expect(page).to have_content "Bookmark Manager!"
  end
end

feature "viewing bookmars in /bookmarks route" do
  scenario "show list of bookmarks" do

    create_bookmark('http://www.makersacademy.com')
    create_bookmark('http://www.destroyallsoftware.com')
    create_bookmark('http://www.google.com')

    visit '/bookmarks'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
