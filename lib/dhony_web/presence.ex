defmodule WebsiteWeb.Presence do
  @moduledoc """
  The presence module for the website.
  """
  use Phoenix.Presence,
    otp_app: :dhony,
    pubsub_server: Website.PubSub
end
