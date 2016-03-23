# ReactJS
## Create a React + Rails application
##### Due Thursday, March 24, 2016  
Integrate Rails and React, pulling in data


Update your IronLibrary to refresh the photo list of books

Submit a link to your repository. __In the repository README please include a screenshot of the application__

First, make sure you're allowing users to upload a photos (use refile and refile-postgres to store them). Use standard rails for this.

* Add A PhotoList component on your homepage
* when the page loads it should pull from `/api/photos.json`
* Have a "Refresh Photos" button that will pull new photos from `/api/photos.json`


## Hard Mode
1. Turn the component into a Gallery, with One large photo and several photos underneath at thumbnail size. When you hover (or click) on a thumbnail, it should use the photo as the main photo.
2. Every 3 seconds, have React check for new

![alt text](http://i.imgur.com/CkecMQV.png)
