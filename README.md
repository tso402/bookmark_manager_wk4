
The requirements :

Show a list of bookmarks
Add new bookmarks
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users manage their bookmarks

As a user
so that I can see a list of bookmarks
it should display the list of bookmarks.
<img src="Screenshot 2019-02-25 at 14.20.42.png">


Database Setup Intructions
Access psql and create the new database and table
$: psql

=# CREATE DATABASE bookmark_manager;

=# \c book_manager

book_manager=# CREATE TABLE "bookmarks" ("id" SERIAL PRIMARY KEY, "url" VARCHAR(60));