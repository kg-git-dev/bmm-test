module Jekyll
  class PopularpostsTagBlock < Liquid::Block
    def render(context)
      text = super
      text.strip!
      site = Jekyll.sites.first
      posts = site.posts.docs

      output = []
      
      pops = posts.select{|p| p.data["categories"].include? "popular"}
      pops.reverse.take(3).each do |post|
        output.push(thepost(post))
      end

      output.join("\n")
    end

    def thepost(post)
      output = []
      output.push "<li>"
      output.push "  <a href=\"#{post.url}\">"
      output.push "    <img width=\"75\" height=\"75\""
      output.push "        src=\"#{post.data['small_image']}\""
      output.push "        class=\"attachment-75x75 size-75x75 wp-post-image\""
      output.push "        alt=\"\">"
      output.push "      <span class=\"rpwwt-post-title\">#{post.data['title']}</span>"
      output.push "    </a>"
      output.push "  <div class=\"rpwwt-post-date\">#{post.data['date'].strftime('%B %d, %Y')}</div>"
      output.push "</li>"
      output.join("\n")
    end
  end
end

Liquid::Template.register_tag('popular_posts', Jekyll::PopularpostsTagBlock)