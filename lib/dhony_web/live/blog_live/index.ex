defmodule WebsiteWeb.BlogLive.Index do
  use WebsiteWeb, :live_view

  alias Website.Blog

  def mount(_params, _session, socket) do
    articles = Blog.all_articles()

    socket =
      socket
      |> assign(:page_title, "Blog - Dhony Silva")
      |> stream(:articles, articles)

    {:ok, socket}
  end
end
