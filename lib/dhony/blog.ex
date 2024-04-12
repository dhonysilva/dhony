defmodule Website.Blog do
  use NimblePublisher,
    build: Website.Blog.Article,
    from: Application.app_dir(:dhony, "priv/resources/articles/**/*.md"),
    as: :articles,
    html_converter: Website.MarkdownConverter

  @articles Enum.filter(@articles, & &1.published) |> Enum.sort_by(& &1.date, {:desc, Date})

  def all_articles, do: @articles

  def recent_articles(count \\ 3), do: Enum.take(all_articles(), count)

  def get_article_by_slug(slug) do
    Enum.find(@articles, &(&1.slug == slug))
  end
end
