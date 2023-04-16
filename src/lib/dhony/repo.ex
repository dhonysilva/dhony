defmodule Dhony.Repo do
  use Ecto.Repo,
    otp_app: :dhony,
    adapter: Ecto.Adapters.Postgres
end
