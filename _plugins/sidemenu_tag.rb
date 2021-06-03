module Jekyll
  class SidemenuTagBlock < Liquid::Block
    def render(context)
      text = super
      text.strip!
      site = Jekyll.sites.first
      sm = site.data["side_menu"]

      if text.include? "side_nav="
        # puts "yo...#{text}"
        key, text = text.split("=")[1].split(",")
      else
        key = find_key(text, sm)
      end

      output = []

      # binding.pry
      if key
        sm[key].each do |item|
          current = match?(text, item['link']) ? "current_page_item" : ""
          output.push "<li class=\"page_item #{current}\"><a href=\"#{item['link']}\">#{item['name']}</a></li>"
        end
      else
        label = "Home"
        output.push "<li class=\"page_item current_page_item\"><a href=\"/\">#{label}</a></li>"
      end

      output.join("\n")
    end

    def find_key(item, sm)
      key = nil
      # puts "item: #{item}"
      # puts "sm: #{sm}"
      sm.each do |k,ary|
        ary.each do |mitem|
          if match?(mitem["link"], item)
            key = mitem.key?("primary") ? mitem["primary"] : k
            return key
          end
        end
      end

      return key
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

Liquid::Template.register_tag('side_menu', Jekyll::SidemenuTagBlock)