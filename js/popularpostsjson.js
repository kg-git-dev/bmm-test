---
---

window.popost = [
  {% for post in site.categories["popular"] %}
    {
      "title": "{{ post.title | xml_escape }}",
      "date": "{{post.date | date: '%B %-d, %Y'}}",
      "image": "{{ post.small_image | xml_escape }}",
      "url": "{{ post.url | xml_escape }}",
      "order": "{{post.date | date: '%Y%m%d'}}"
    }
    {% unless forloop.last %},{% endunless %}
  {% endfor %}
  ];