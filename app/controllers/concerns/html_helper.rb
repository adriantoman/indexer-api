module HtmlHelper
  def find_tags(document,tags)
    output = {}
    tags.each do |tag|
      if (tag == 'link')
        output['link'] = document.search('a').map{ |element| element['href'] ? element['href'].html_safe : nil}.compact
      else
        document.search(tag).each do |element|
          output[tag] = [] unless output[tag]
          output[tag] << element.to_html
        end
      end
    end
    output
  end

  def valid_url?(uri)
    uri = URI.parse(uri)
    !uri.host.nil? && %w(https http).include?(uri.scheme)
  rescue
    false
  end


end