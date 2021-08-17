## User stories and views for the BDD of Bookmark_Challenge
```
1.Show a list of bookmarks
  As a user
  In order to see all the bookmarks
  I want to be able to list from the database all the content

  1.Main view - loads all the bookmarks/tagged
```
```
2.Add new bookmarks
  As a user
  In order to add a new bookmark
  I want to have a menu/button that will navigate to a form/page to complete

  2.Add bookmark view - form ['name', 'content/url', 'tag', 'description']
```
```
3.Delete bookmarks
  As a user
  In order to delete one of my bookmarks
  I want to have access to a button/menu executing the deletion with a confirmation message

  3.Delete bookmark view - with own bookmarks and option form to delete
```
```
4.Update bookmarks
  As a user
  In order to update one of my bookmarks
  I want to have a button/menu executing the update to the changeable fields in a form type

  4.Update view - only one of my bookmarks and a form['name', 'tag', 'description']
```
```
5.Comment on bookmarks
  As a user
  In order in order to comment on any bookmark
  I want to have a text field where I can place the comment and submit it

  5.Comment view - only one bookmark a form to add a comment and submit
```
```
6.Tag bookmarks into categories
  As a user
  In order to tag one of my bookmarks
  I want to have a text field where I can input/add the tag and submit

  4.Update view - only one of my bookmarks and a form['name', 'tag', 'description']
```
```
7.Filter bookmarks by tag
  As a user
  In order to filter the bookmarks available
  I want to have a text field where I can add my filter and submit

  1.Main view - loads all the bookmarks by tag
```
```
8.Users are restricted to manage only their own bookmarks
  As a user
  In order to restrict the access to my bookmarks for any other user
  I want all existing bookmarks to be accessed based on login credentials

  Backend
``` 


## DATABASE setup procedure and usage:
```
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql
```