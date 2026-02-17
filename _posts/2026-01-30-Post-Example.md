---
layout: posts
title: "Post Example"
date: 2026-01-30
author: "Your Name"
tags: ["Faculty", "Student", "Tool", "Space", "Pedagogy", "People", "Digital Humanities", "Media", "Publishing", "AI"] #recommended that you keep only 2 of these tags, 3 if you must
published: false
---

Make a copy of this post. 

Update your title and date above. Make sure your file is correctly named as YYYY-MM-DD-title-words.md.

Replace this text with your blog content. 

If you want to add an image:
    First, put your jpg or png in the folder located at: assets/images/blog.
    Next, copy an "include" command directly into your post, like this:
        {% include image.html src="clock.jpg" alt="brass antique clock face" caption="An image from Unsplash" %}
    Keep "image.html" the same, but chanage the src to your image file name. Next, add alt text between the quotation marks next to alt. Finally, add a caption if you want. If you don't want a caption, delete the entire "caption=" attribute from the include command. 

When you are ready for your post to go live on the site, return to the header at the top of this page and change "published: false" to "published: true"