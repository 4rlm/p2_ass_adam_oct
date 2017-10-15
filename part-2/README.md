# Part 2:  AJAX

## Summary
In Part 2 we'll take a functioning Sinatra application and enhance the user
experience by adding some AJAX calls.  The application is a simple guestbook for a youth hostel.  Guests can author posts on the guestbook and also like posts.  There is no authentication involved.


### Current Site:  Writing a New Post
When writing a new post on the current, AJAX-less site, the user visits the site root where a list of recent posts and a form are displayed.  The user fills out and submits the form.  If the new post is successfully created, the user is directed to a new page where the new post is shown. (see [animation][current-new-post])


### Current Site:  Liking a Post
Liking a post on the current, AJAX-less site can be done either from the site root or from a page showing a specific post.  On either page, where a post is displayed, a "Like This Comment" button is also visible.  Clicking on the button increases the like count for the post and directs the user to a page where the liked post is shown.  (see [animation][current-like])


### Future Site
Our AJAX enhancements will make it so the user never leaves the homepage.  All requests will be AJAX requests, and we'll update the DOM based on the responses.  Specific details will be addressed in the releases.


## Releases
### Release 0: Update Writing a New Post
![ajax new post][ajax-new-post]  
*Figure 1*. Writing a new post with AJAX.

Begin by updating how new posts are created.  When the form to create a new post is submitted and the server response is received, (1) the page should be updated to show the new post and (2) the form should be reset (see Figure 1).


### Release 1: Update Liking a Post
![ajax like][ajax-like]  
*Figure 2*.  Liking a post with AJAX.

Improve the experience of liking a post.  As seen in Figure 2, when clicking the button to like a post, the page should be updated to reflect the new like count.  The page should not refresh or redirect.

*Note:*  This should work for posts that were added to the page after the initial page load, *without refreshing the page*.


### Release 2: Graceful Degradation
When we enhance a site with JavaScript, we want to preserve the functionality of our site for users without JavaScript.  So, if a user has disabled JavaScript, our site should retain its AJAX-less features.  [Use the Chrome Developer Tools to disable JavaScript][disable JS] (Version 51.0.2704.106 shown) and ensure that the site works without it.


## Conclusion
You have completed Part 2 of the assessment. If you haven't done so already, commit your changes and move on to Part 3.


[ajax-new-post]: readme-assets/ajax-new-post.gif
[ajax-like]: readme-assets/ajax-like.gif
[current-new-post]: readme-assets/current-new-post.gif
[current-like]: readme-assets/current-like.gif
[disable JS]: readme-assets/disable-javascript.gif

