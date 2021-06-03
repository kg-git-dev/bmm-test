(function() {
  function displaySearchResults(results, store) {
    var searchResults = document.getElementById('search-results');

    if (results.length) { // Are there any results?
      var appendString = '';

      for (var i = 0; i < results.length; i++) {  // Iterate over the results
        var item = store[results[i].ref];

        appendString += '<div class="br-inner">'
        appendString += '  <div class="br-post-content">'
        appendString += '    <div class="br-title">'
        appendString += '      <a href="' + item.url + '">' + item.title + '</a>'
        appendString += '    </div>'
        appendString += '    <div class="entry-content">'
        appendString += '      <p>' + item.content.substring(0, 300) + '[...]</p>'
        appendString += '      <span class="read-more"><a href="' + item.url + '">Read more &gt;</a></span>'
        appendString += '    </div>'
        appendString += '  </div>'
        appendString += '</div>'
      }

      searchResults.innerHTML = appendString;
    } else {
      searchResults.innerHTML = '<div class="search-tagline">Sorry, but nothing matched your search criteria. Please try again with some different keywords.</div>';
    }
  }

  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');

    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split('=');

      if (pair[0] === variable) {
        return decodeURIComponent(pair[1].replace(/\+/g, '%20'));
      }
    }
  }

  var searchTerm = getQueryVariable('query');

  if (searchTerm) {
    var stelms = document.getElementsByClassName("search-term")
    for(let elm of stelms) { elm.innerHTML = searchTerm; }
    var stelms = document.getElementsByClassName("search-term-input")
    for(let elm of stelms) { elm.value = searchTerm; }

    // Initalize lunr with the fields it will be searching on. I've given title
    // a boost of 10 to indicate matches on this field are more important.
    var idx = lunr(function () {
      this.field('id');
      this.field('title', { boost: 10 });
      this.field('author');
      this.field('categories');
      this.field('content');

      for (var key in window.store) { // Add the data to lunr
        this.add({
          'id': key,
          'title': window.store[key].title,
          'author': window.store[key].author,
          'categories': window.store[key].categories,
          'content': window.store[key].content
        });
      }
    });

    var results = idx.search(searchTerm); // Get lunr to perform a search
    displaySearchResults(results, window.store); // We'll write this in the next section
  }
})();