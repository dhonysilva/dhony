defmodule Website.MarkdownConverter do
  def convert(_path, body, _attrs, _opts) do
    MDEx.to_html(body, extension: [header_ids: ""])
  end
end
