defmodule WebsiteWeb.CustomComponents do
  use Phoenix.Component
  import Phoenix.Component

  @doc """
  Renders a title.
  """
  attr :text, :string, required: true

  def title(assigns) do
    ~H"""
    <h1 class="text-3xl font-semibold">
      <%= @text %>
    </h1>
    """
  end

  @doc """
  Renders the page intro.
  """
  attr :title, :string, default: nil
  slot :inner_block

  def page_intro(assigns) do
    ~H"""
    <.title :if={@title} text={@title} />
    <div :if={@inner_block != []} class="text-pretty my-8 leading-relaxed md:my-12 lg:w-2/3">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end


  @doc """
  Renders all contact links.
  """
  attr :class, :string, default: nil
  attr :icon_class, :string, required: true

  def contact_links(assigns) do
    ~H"""
    <div class={@class}>
      <.link href="https://github.com/dhonysilva" target="_blank">
        <span class="sr-only">GitHub Icon</span>
        <.github_icon class={@icon_class} />
      </.link>
      <.link href="https://linkedin.com/in/dhonysilva" target="_blank">
        <span class="sr-only">LinkedIn Icon</span>
        <.linkedin_icon class={@icon_class} />
      </.link>
      <.link href="https://x.com/dhonysilva" target="_blank">
        <span class="sr-only">X Icon</span>
        <.x_icon class={@icon_class} />
      </.link>
    </div>
    """
  end





  @doc """
  Renders the GitHub icon.
  """
  attr :class, :string, default: nil

  def github_icon(assigns) do
    ~H"""
    <svg viewBox="0 0 24 24" aria-hidden="true" class={@class}>
      <path
        fill-rule="evenodd"
        clip-rule="evenodd"
        d="M12 2C6.475 2 2 6.588 2 12.253c0 4.537 2.862 8.369 6.838 9.727.5.09.687-.218.687-.487 0-.243-.013-1.05-.013-1.91C7 20.059 6.35 18.957 6.15 18.38c-.113-.295-.6-1.205-1.025-1.448-.35-.192-.85-.667-.013-.68.788-.012 1.35.744 1.538 1.051.9 1.551 2.338 1.116 2.912.846.088-.666.35-1.115.638-1.371-2.225-.256-4.55-1.14-4.55-5.062 0-1.115.387-2.038 1.025-2.756-.1-.256-.45-1.307.1-2.717 0 0 .837-.269 2.75 1.051.8-.23 1.65-.346 2.5-.346.85 0 1.7.115 2.5.346 1.912-1.333 2.75-1.05 2.75-1.05.55 1.409.2 2.46.1 2.716.637.718 1.025 1.628 1.025 2.756 0 3.934-2.337 4.806-4.562 5.062.362.32.675.936.675 1.897 0 1.371-.013 2.473-.013 2.82 0 .268.188.589.688.486a10.039 10.039 0 0 0 4.932-3.74A10.447 10.447 0 0 0 22 12.253C22 6.588 17.525 2 12 2Z"
      >
      </path>
    </svg>
    """
  end

  @doc """
  Renders the X icon.
  """
  attr :class, :string, default: nil

  def x_icon(assigns) do
    ~H"""
    <svg viewBox="0 0 24 24" aria-hidden="true" class={@class}>
      <path d="M13.3174 10.7749L19.1457 4H17.7646L12.7039 9.88256L8.66193 4H4L10.1122 12.8955L4 20H5.38119L10.7254 13.7878L14.994 20H19.656L13.3171 10.7749H13.3174ZM11.4257 12.9738L10.8064 12.0881L5.87886 5.03974H8.00029L11.9769 10.728L12.5962 11.6137L17.7652 19.0075H15.6438L11.4257 12.9742V12.9738Z">
      </path>
    </svg>
    """
  end

  @doc """
  Renders the LinkedIn icon.
  """
  attr :class, :string, default: nil

  def linkedin_icon(assigns) do
    ~H"""
    <svg viewBox="0 0 24 24" aria-hidden="true" class={@class}>
      <path d="M18.335 18.339H15.67v-4.177c0-.996-.02-2.278-1.39-2.278-1.389 0-1.601 1.084-1.601 2.205v4.25h-2.666V9.75h2.56v1.17h.035c.358-.674 1.228-1.387 2.528-1.387 2.7 0 3.2 1.778 3.2 4.091v4.715zM7.003 8.575a1.546 1.546 0 01-1.548-1.549 1.548 1.548 0 111.547 1.549zm1.336 9.764H5.666V9.75H8.34v8.589zM19.67 3H4.329C3.593 3 3 3.58 3 4.297v15.406C3 20.42 3.594 21 4.328 21h15.338C20.4 21 21 20.42 21 19.703V4.297C21 3.58 20.4 3 19.666 3h.003z">
      </path>
    </svg>
    """
  end

  @doc """
  Renders the mail icon
  """
  attr :class, :string, default: nil

  def mail_icon(assigns) do
    ~H"""
    <svg viewBox="0 0 24 24" aria-hidden="true" class={@class}>
      <path
        fill-rule="evenodd"
        d="M6 5a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h12a3 3 0 0 0 3-3V8a3 3 0 0 0-3-3H6Zm.245 2.187a.75.75 0 0 0-.99 1.126l6.25 5.5a.75.75 0 0 0 .99 0l6.25-5.5a.75.75 0 0 0-.99-1.126L12 12.251 6.245 7.187Z"
      >
      </path>
    </svg>
    """
  end
end
