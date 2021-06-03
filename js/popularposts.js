var posts = window.popost;
var randPosts = [];
do {
  randPosts[randPosts.length] = posts.splice(
                                Math.floor(Math.random() * posts.length)
                              , 1)[0];
} while (randPosts.length < 3);

randPosts.sort(function(a, b){
  var keyA = new Date(a.date),
      keyB = new Date(b.date);
  // Compare the 2 dates
  if(keyA < keyB) return -1;
  if(keyA > keyB) return 1;
  return 0;
});

var appendString = '';

for (var i = 0; i < randPosts.length; i++) {  // Iterate over the results
  var item = randPosts[i];

  appendString += '<li>'
  appendString += '  <a href="' + item.url + '">'
  appendString += '    <img width="75" height="75"'
  appendString += '        src="' + item.image + '"'
  appendString += '        class="attachment-75x75 size-75x75 wp-post-image"'
  appendString += '        alt="">'
  appendString += '      <span class="rpwwt-post-title">' + item.title + '</span>'
  appendString += '    </a>'
  appendString += '  <div class="rpwwt-post-date">' + item.date + '</div>'
  appendString += '</li>'
}

var popList = document.getElementsByClassName('popular_posts_list');
for(pl of popList) {
  pl.innerHTML = appendString;
}

