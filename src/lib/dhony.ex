defmodule Dhony do
  @moduledoc """
  Dhony keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  use Phonenix.Component
  import Phonenix.HTML

  def post(assigns) do
    ~H"""
      <.layout>
        <%= raw @post.body %>
      </.layout>
    """
  end

  def index(assigns) do
    ~H"""
    <.layout>
      <h1>Jason's Personal website!!</h1>
      <h2>Posts!</h2>
      <ul>
        <li :for={post <- @posts}>
          <a href={post.path}> <%= post.title %> </a>
        </li>
      </ul>
    </.layout>
    """
  end

  def layout(assigns) do
    ~H"""
    <html>
      <body>
        <%= render_slot(@inner_block) %>
      </body>
    </html>
    """
  end
end
