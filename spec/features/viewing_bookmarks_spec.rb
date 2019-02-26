feature "Shoewing bookmark term" do
  scenario "The bookmarks term is shown when we start" do
    visit "/"
    expect(page).to have_content "bookmarks"
  end

  scenario "The makers web page is shown in bookmarks" do
    visit"/"
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
