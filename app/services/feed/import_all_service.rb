class Feed::ImportAllService < Service
  def call
    feeds.each do |feed|
      Feed::ImportService.call(feed)
    end
  end

  private

  def feeds
    Feed
      .preload(:user, :category)
      .reorder(:last_update_at)
  end
end