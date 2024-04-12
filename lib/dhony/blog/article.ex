defmodule Website.Blog.Article do

  defstruct id: "",
            slug: "",
            title: "",
            date: nil,
            description: "",
            body: "",
            heading_links: [],
            published: false


  def build(filename, attrs, body) do
    [year, month_day_id] = filename |> Path.rootname() |> Path.split() |> Enum.take(-2)
    [month, day, id] = String.split(month_day_id, "-", parts: 3)
    date = Date.from_iso8601!("#{year}-#{month}-#{day}")

    heading_links = parse_headings(body)

    struct!(
      __MODULE__,
      [id: id, date: date, body: body, heading_links: heading_links] ++
      Map.to_list(attrs)
    )
  end

  def parse_headings(body) do
    body
    |> Floki.parse_fragment!()
    |> Enum.reduce([], fn
      {"h2", _class, child} = el, acc ->
        acc ++ [%{label: Floki.text(el), href: get_href(child), childs: []}]

      {"h3", _class, child} = el, acc ->
        List.update_at(acc, -1, fn %{childs: subs} = h2 ->
          %{h2 | childs: subs ++ [%{label: Floki.text(el), href: get_href(child), childs: []}]}
        end)

      _other, acc ->
        acc
      end)
  end

  def get_href(heading_element) do
    attr = heading_element |> Floki.find("a") |> Floki.attribute("href")

    case attr do
      [] -> nil
      [href | _] -> href
    end
  end
end
