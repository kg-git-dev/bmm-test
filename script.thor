require 'date'

class Script < Thor
  desc "make_posts", "make posts"
  def make_posts(days=0, title="just-a-test" )
    now = DateTime.now
    ((now - days.to_i)..now).each do |d|
      dtime = d.strftime("%Y-%m-%d")
      fname = "_posts/#{dtime}-#{title}.markdown"

      doc = []
      doc.push "---"
      doc.push "layout: post"
      doc.push "title:  Just a test #{dtime}"
      doc.push "date:   #{dtime} 08:00:00 -0000"
      doc.push "categories: jekyll update"
      doc.push "---"
      doc.push "# #{dtime}"

      File.open(fname, "w") do |f|
        f.write(doc.join("\n"))
      end
    end
  end

end