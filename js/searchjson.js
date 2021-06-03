---
---

window.store = {
  {% assign allofit = "placeholder" | search_all %}

  {% for post in allofit %}
    "{{ post.url | slugify }}": {
      "title": "{{ post.title | xml_escape }}",
      "author": "{{ post.author | xml_escape }}",
      "categories": "{{ post.categories | xml_escape }}",
      "content": {{ post.content | strip_html | strip_newlines | jsonify }},
      "url": "{{ post.url | xml_escape }}"
    }
    {% unless forloop.last %},{% endunless %}
  {% endfor %}
};