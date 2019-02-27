feature "index page for bookmark manager" do
  scenario "basic index page" do
    visit '/'
    expect(page).to have_content "Bookmark Manager!"
  end
end

feature "viewing bookmars in /bookmarks route" do
  scenario "show list of bookmarks" do

    create_bookmark('http://www.makersacademy.com', 'Makers')
    create_bookmark('http://www.destroyallsoftware.com', 'DAS')

    visit '/bookmarks'
    expect(page).to have_content "Makers"
    expect(page).to have_content "DAS"
  end
end
