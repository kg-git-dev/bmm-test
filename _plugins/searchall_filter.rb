module Jekyll
  module SearchallFilter
    def search_all(input)
      site = Jekyll.sites.first
      # site.posts.docs
      # site.pages
      # site.collections["treatment-team"].docs
      allstuff = []
      pages = site.pages.select{|p| p["title"]}
      ignore_urls = ["/success", "/search", "/404"]
      pages.reject!{|p| ignore_urls.include?(p["url"]) }
      allstuff.push(pages)
      site.collections.each do |k,v|
        allstuff.push(v.docs)
      end
      allstuff.flatten!
      allstuff
    end
  end
end

Liquid::Template.register_filter(Jekyll::SearchallFilter)