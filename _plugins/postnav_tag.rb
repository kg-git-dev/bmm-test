module Jekyll
  class PostnavTagBlock < Liquid::Block
    def render(context)
      text = super
      text.strip!
      site = Jekyll.sites.first
      posts = site.posts.docs

      prev = nil
      nex = nil
      
      posts.each_with_index do |post, idx|
        if match?(post.url,text)
          prev = idx == 0 ? nil : posts[idx - 1]
          nex = posts[idx + 1]
          break
        end
      end
      
      output = []
      
      output.push prev_html(prev) if prev
      output.push nex_html(nex) if nex

      output.join("\n")
    end

    def prev_html(prev)
      output = []
      output.push "<span class=\"nav-previous\">"
      output.push "  <a href=\"#{prev.url}\" rel=\"prev\">"
      output.push "    <span class=\"meta-nav\"><</span> "
      output.push "    Previous"
      output.push "  </a>"
      output.push "</span>"
      output.join("\n")
    end

    def nex_html(nex)
      output = []
      output.push "<span class=\"nav-next\">"
      output.push "  <a href=\"#{nex.url}\" rel=\"next\">"
      output.push "    Next"
      output.push "    <span class=\"meta-nav\">></span>"
      output.push "  </a>"
      output.push "</span>"
      output.join("\n")
    end

    def match?(url, matcher)
      c1 = url[-1] == "/" ? url.chop() : url
      c2 = matcher[-1] == "/" ? matcher.chop() : matcher
      # puts "c1: #{c1}"
      # puts "c2: #{c2}"
      c1 == c2
    end
  end
end

Liquid::Template.register_tag('post_nav', Jekyll::PostnavTagBlock)