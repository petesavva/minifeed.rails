class Entry::CreateFromUrlService < ApplicationService
  attr_reader :url, :user

  def initialize(url, user:)
    @url = url
    @user = user
  end

  def call
    return false if invalid_url?

    entry = Entry.find_or_initialize_by(user: user, feed: nil, external_id: url)

    entry.attributes = {
      :name         => entry_name,
      :body         => entry_body,
      :author       => entry_author,
      :url          => url,
      :published_at => Time.current,
      :is_read      => true,
      :is_starred   => true,
    }

    entry.save!
  end

  private

  def invalid_url?
    !valid_url?
  end

  def valid_url?
    URI.parse(url.to_s).is_a?(URI::HTTP)
  end

  def entry_name
    html_title || sanitized_url
  end

  def sanitized_url
    url.split("?").first
  end

  def html_title
    sanitize html.css("title").text
  end

  def entry_body
    meta_description || og_description
  end

  def entry_author
    meta_author || og_site_name
  end

  def og_description
    get_og_tag(:description)
  end

  def meta_description
    get_meta_tag(:description)
  end

  def meta_author
    get_meta_tag(:author)
  end

  def og_site_name
    get_og_tag(:site_name)
  end

  def get_meta_tag(name)
    sanitize html.css("meta[name=#{name}]").attr("content")
  end

  def get_og_tag(name)
    sanitize html.css("meta[property='og:#{name}']").attr("content")
  end

  def raw_html
    @raw_html ||= HttpClient.request(:get, url).to_s
  rescue HttpClient::Error
    ""
  end

  def html
    @html ||= Nokogiri::HTML(raw_html)
  end

  def sanitize(text)
    text.to_s.strip.presence
  end
end
