# Bookmark Manager project

## User stories

```
As a user
So that I can access my favourite sites fast
I want to see a list of links from the database
```
```
As a user
So that I can keep extending my database of links
I want to be able to add new link to the list
```
```
As a user
So that I can look up links based on certain criteria
I want to add tags to the links
```
```
As a user
So I can list my specific links based on keywords
I want to be able to filter by their tags
```
## Rough Domain Model

|OBJECTS | MESSAGES |
|---------------|-----------------|
|Bookmark Manager|show_links|
|Bookmark Manager|add_links (title, URL)|
|Bookmark Manager|filter_links (based on tag)|
|Links|add_tag|
