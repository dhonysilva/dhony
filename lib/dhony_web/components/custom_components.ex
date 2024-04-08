defmodule WebsiteWeb.CustomComponents do
  use Phoenix.Component
  import Phoenix.Component

  use WebsiteWeb, :verified_routes

  import WebsiteWeb.Gettext

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
  Renders a modal.
  """
  attr :id, :string, required: true, doc: "the unique id of the modal"
  attr :header, :string, default: nil, doc: "the modal header"

  slot :inner_block, doc: "the inner block that renders the modal content"

  def modal(assigns) do
    ~H"""
    <dialog id={@id} class="modal">
      <div class="modal-box">
        <form method="dialog">
          <button class="btn btn-sm btn-circle btn-ghost absolute top-2 right-2">✕</button>
        </form>
        <h3 if={@header} class="text-base-content text-lg font-bold">
          <%= @header %>
        </h3>
        <%= render_slot(@inner_block) %>
      </div>
      <form method="dialog" class="modal-backdrop">
        <button>
          <%= gettext("close") %>
        </button>
      </form>
    </dialog>
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
  Renders the navbar.
  """
  attr :current_url, :string, required: true

  def navbar(assigns) do
    ~H"""
    <nav class="flex h-20">
      <div class="mx-auto flex w-full max-w-6xl items-center justify-between px-4">
        <.avatar />

        <div class="rounded-btn bg-base-300 hidden space-x-2 px-4 py-2 sm:block">
          <.link
            :for={%{label: label, to: to} <- main_navigation_links()}
            navigate={to}
            class={["btn btn-sm", if(active?(@current_url, to), do: "btn-primary", else: "btn-ghost")]}
          >
            <%= label %>
          </.link>
        </div>

        <div class="rounded-btn bg-base-300 block p-2 sm:hidden">
          <button
            class="btn-sm flex items-center font-semibold"
            onclick="mobile_navigation.showModal()"
          >
            <span>Menu</span>
          </button>
        </div>

      </div>
    </nav>
    """
  end

  def avatar(assigns) do
    ~H"""
    <.link navigate={~p"/"} class="avatar cursor-pointer">
      <div class="h-10 w-auto rounded-full">
        <img loading="lazy" src={~p"/images/dhony_perfil.jpg"} alt="Portrait of Dhony Silva" />
      </div>
    </.link>
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

  @doc """
  Renders the mobile navigation modal.
  """
  def mobile_navigation(assigns) do
    ~H"""
    <.modal id="mobile_navigation" header="Navigation">
      <nav class="mt-4 flex flex-col space-y-4">
        <.link :for={%{label: label, to: to} <- main_navigation_links()} navigate={to}>
          <%= label %>
        </.link>
      </nav>
    </.modal>
    """
  end

  @doc """
  Renders a footer.
  """
  attr :class, :string, default: nil
  attr :current_url, :string, required: true

  def footer(assigns) do
    ~H"""
    <footer class="mx-auto w-full max-w-6xl px-4">
      <div class="bg-base-content h-px w-full opacity-20" />
      <div class="my-8 md:my-12">
        <div class="flex w-full flex-col flex-wrap justify-between gap-x-6 gap-y-6 md:flex-row">
          <nav class="">
            <p class="footer-title">Pages</p>
            <.link
              :for={%{label: label, to: to} <- main_navigation_links()}
              navigate={to}
              class={[
                "font-semibold mr-4",
                if(active?(@current_url, to), do: "text-primary", else: "text-content")
              ]}
            >
              <%= label %>
            </.link>
          </nav>
          <div>
            <p class="footer-title">Connect</p>
            <.contact_links class="flex space-x-4" icon_class="w-6 h-6 text-content fill-current" />
          </div>
          <nav class="md:flex md:w-full md:justify-center">
            <p class="footer-title md:hidden">Legal</p>
            <.link
              :for={%{label: label, to: to} <- secondary_navigation_links()}
              navigate={to}
              class={[
                "font-semibold md:text-sm mr-4 md:opacity-60",
                if(active?(@current_url, to), do: "text-primary !opacity-100", else: "text-content")
              ]}
            >
              <%= label %>
            </.link>
          </nav>
        </div>
      </div>
    </footer>
    """
  end

  defp main_navigation_links do
    [
      %{label: "Home", to: ~p"/"},
      %{label: "About", to: ~p"/about"},
      %{label: "Blog", to: ~p"/blog"}
      # %{label: "Projects", to: ~p"/projects"}
    ]
  end

  defp secondary_navigation_links do
    [
      %{label: "Legal Notice", to: ~p"/legal-notice"},
      %{label: "Privacy Policy", to: ~p"/privacy-policy"}
    ]
  end

  defp active?(current_url, to) do
    %{path: path} = URI.parse(current_url)

    if to == "/", do: path == to, else: String.starts_with?(path, to)
  end

end
