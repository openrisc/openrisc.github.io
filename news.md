---
layout: page
title: News
tagline: 
group: navigation
weight: 1
---
{% include JB/setup %}

To the [archive]({{ BASE_PATH }}/archive.html).

<ul class="posts">  
  {% for post in site.posts %}  
    <li>  
      <span><b>{{ post.date | date_to_string }}</b></span> &raquo;  
      <a href="{{ BASE_PATH }}{{ post.url }}">  
      <b>{{post.title}}</b></a><br/>
      <i>({{post.author}})</i> {{ post.content | strip_html | truncatewords: 50 }}..
      <a href="{{ BASE_PATH }}{{ post.url }}">  
      more</a><br/>
    </li>
  {% endfor %}  
</ul>
