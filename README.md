# Compiling News of Your Interest (CNYI)
#### LITG Project in RoR

CNYI is a customizable news collection website. It displays the recent news according to the already filled in preference of users. The users can choose the type of news they want to see like Tech, Business, etc., and may even choose some sources where they want to see it from, like The Hindu, Times of India, or even Twitter and HN(YCombinator).

CNYI makes extensive use of APIs of different News sources, RSS and Web Scraping. The MVC framework built in Rails provides good support for CNYI.Currently, only news from the Guardian news source is used with the help of their API.

#### Getting Started

1. Clone this repo
2. Make sure you have an almost latest version of both Ruby and Rails in your system
3. `bundle install` in the root directory
4. `rails server`
5. Navigate to _127.0.0.1:3000_

#### Using CNYI

1. Login or register yourself
2. Go to /news for going through the news. If the user has not selected any preference, they will see all news of that day
3. To select preferences, click on the Preferences link in the navigation bar. Enter your preference, like sports, technology, politics, etc.

#### TODO
1. Convert categories into drop down menu
2. Add more news sources
3. Take footer down
