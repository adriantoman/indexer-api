require 'rails_helper'

RSpec.describe 'HtmlHelper' do
  let(:dummy_class) { Class.new { extend HtmlHelper } }

  describe 'find_tags' do
    let(:document) {
      html ="<html><h1>Test H1</h1><h1>Test H1 B</h1><h1>Test H3 B</h1><h2>Test H3 B</h2></html>"
      Nokogiri::HTML.fragment(html)
    }

    let(:document_with_links) {
      html ="<html><a href='https://www.seznam.cz'>test</a></html>"
      Nokogiri::HTML.fragment(html)
    }

    let(:document_without_links) {
      html ='<html></html>'
      Nokogiri::HTML.fragment(html)
    }
    let(:tags) {%w(link)}


    it 'to find h1 tags' do
      result = dummy_class.find_tags(document,%w(h1))
      expect(result['h1']).not_to be_empty
      expect(result['h1'].count).to eq(3)
    end

    it 'to not find any other tag' do
      result = dummy_class.find_tags(document,%w(h1))
      expect(result['h2']).to be_nil
    end

    it 'to find all links' do
      result = dummy_class.find_tags(document_with_links,tags)
      expect(result['link'].first).to eq('https://www.seznam.cz')
    end

    it 'to not find wrong elements' do
      result = dummy_class.find_tags(document_without_links,tags)
      expect(result['link']).to be_empty
    end
  end

  describe 'valid_url' do
    it 'validates valid URL correctly' do
      expect(dummy_class.valid_url?('https://www.seznam.cz')).to be_truthy
      expect(dummy_class.valid_url?('http://www.seznam.cz')).to be_truthy
    end

    it 'validates invalid URL correctly' do
      expect(dummy_class.valid_url?('h://www.seznam.cz')).to be_falsey
      expect(dummy_class.valid_url?('h.seznam.cz')).to be_falsey
      expect(dummy_class.valid_url?('test_url')).to be_falsey
    end

  end

end