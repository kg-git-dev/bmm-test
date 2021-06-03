module Jekyll
  class BreadcrumbTagBlock < Liquid::Block
    def render(context)
      page_url = super
      page_url.strip!
      site = Jekyll.sites.first
      navitems = site.data["navigation"]
      crumbs = []

      crumbs.push(crumb_data(navitems.first)) # insert home crumb

      if is_this_a_blog_post?(page_url)
        process_blog(page_url, crumbs)
      else
        # populate crumbs during the search
        # ignore the first navitem, which is assumed to be home link
        find_page_url_within_navitems(page_url, navitems.drop(1), crumbs)
      end

      html = []
      crumbs.each_with_index do |crumb, idx|
        if crumb == crumbs.last
          html.push(nolink(crumb,idx))
        else
          html.push(linked(crumb,idx))
        end
      end

      # binding.pry
      html.join(">")
    end

    def crumb_data(navitem)
      {
        name: navitem["name"],
        link: navitem["link"]
      }
    end

    def namify(name)
      val = name.split("/").reject {|s| s.empty?}.join("")
      val.gsub(/-/, " ").split.each{|x| x.capitalize!}.join(' ')
    end

    def nolink(info, idx)
      output = []
      output.push "<span property=\"itemListElement\" typeof=\"ListItem\">"
      output.push "  <span property=\"name\">#{info[:name]}</span>"
      output.push "  <meta property=\"position\" content=\"#{idx}\">"
      output.push "</span>"
      output.join("\n")
    end

    def linked(info, idx)
      output = []
      output.push "<span property=\"itemListElement\" typeof=\"ListItem\">"
      output.push "  <a property=\"item\" typeof=\"WebPage\" title=\"#{info[:name]}\" href=\"#{info[:link]}\">"
      output.push "    <span property=\"name\">#{info[:name]}</span>"
      output.push "  </a>"
      output.push "  <meta property=\"position\" content=\"#{idx}\">"
      output.push "</span>"
      output.join("\n")
    end

    def find_page_url_within_navitems(page_url, navitems, crumbs = [])
      navitems.each do |navitem|
        crumbs.push(crumb_data(navitem))

        comparer_item = navitem["link"]

        if is_this_it?(page_url, comparer_item)
          crumbs.pop() if crumbs.length == 1 # ignore the 1 item crumb
          return true # found it
        else
          # keep looking within dropdown
          if navitem.key?("dropdown")
            if find_page_url_within_navitems(page_url, navitem["dropdown"], crumbs)
              return true # found it
            end
          end
          crumbs.pop()
        end
      end

      # didn't find it, doesn't exist in navigation.yml
      return false
    end

    def is_this_it?(page_url, comparer_item)
      remove_slash(page_url) == remove_slash(comparer_item)
    end

    def is_this_a_blog_post?(page_url)
      # remove the "/blog/ prefix only if it has it and see if there's still some text"
      if page_url.include?("/blog/") && page_url.sub("/blog/", "").length > 0
        return true
      else
        return false
      end
    end

    def process_blog(page_url, crumbs)
      crumbs.push({name: "Blog", link: "/blog"})
      title = get_blog_title(page_url)
      crumbs.push({name: title, link: "/blog"}) if title.length > 0
    end

    def get_blog_title(blog_url)
      collections = Jekyll.sites.first.collections

      keys = collections.keys # eg ["posts", "treatment-team", "staff", "testimonials", "faqs", "events", "wellness-resources"]
      
      (0..keys.length - 1).each do |idx|
        pages = collections.values[idx].docs
        blog_page = pages.find{|p| p.url == blog_url}

        return blog_page.data["title"] if blog_page
      end

      return ""
    end

    def remove_slash(str)
      str[-1] == "/" ? str.chop() : str
    end
  end
end

Liquid::Template.register_tag('breadcrumb', Jekyll::BreadcrumbTagBlock)