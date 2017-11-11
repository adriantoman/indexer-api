class PagesController < ApplicationController

  include HtmlHelper

  # GET /pages
  def index
    @pages = Page.all
    render :json => @pages.to_json( :include =>
                                        {:page_elements => {:except => [:id,:page_id,:created_at,:updated_at]}},
                                    :except => [:id,:created_at,:updated_at] )
  end

  # POST /pages
  def create
    raise StandardError, "Param 'url' not found" if !params.include?('url')
    url = params['url']
    raise StandardError, "Url #{url} is not valid. It must start with http:// or http://" unless valid_url?(url)
    doc = HTTParty.get(url)
    document = Nokogiri::HTML.fragment(doc)
    ActiveRecord::Base.transaction do
      page = Page.create(url: url)
      tags = %w(h1 h2 h3 link)
      parsed_values = find_tags(document,tags)
      parsed_values.each_pair do |k,v|
        v.each do |content|
          page.page_elements.create(content: content,element_type: PageElement::ELEMENT_TYPE_MAPPING.key(k))
        end
      end
      page.save!
    end

    render :json => {:status => 'ok'}
  end


end
