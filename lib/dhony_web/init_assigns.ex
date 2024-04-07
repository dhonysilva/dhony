defmodule WebsiteWeb.InitAssigns do
  import Phoenix.Component
  import Phoenix.LiveView

  @doc """
  Initializes the assigns for the default live view.
  """
  def on_mount(:default, _params, _session, socket) do
    socket =
      socket
      |> attach_current_url_hook()
      |> assign(:page_title, "Dhony Silva - Developer")

    {:cont, socket}
  end

  @doc """
  Attaches the current URL to the socket.
  """
  def attach_current_url_hook(socket) do
    attach_hook(socket, :attach_url_hook, :handle_params, fn
      _params, url, socket ->
        socket =
          socket
          |> assign(:current_url, url)

        {:cont, socket}
    end)
  end
end
