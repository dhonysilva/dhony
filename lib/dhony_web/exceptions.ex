defmodule WebsiteWeb.ResourceNotFoundError do
  alias WebsiteWeb.ResourceNotFoundError

  defexception plug_status: 404, message: "no resource found", conn: nil, router: nil

  def exception(opts) do
    resource = Keyword.fetch!(opts, :resource)
    slug = Keyword.fetch!(opts, :slug)

    %ResourceNotFoundError{message: "no resources for type #{resource} found with slug #{slug}"}
  end
end
