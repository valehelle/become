defmodule BecomeWeb.PageController do
  use BecomeWeb, :controller
  alias Become.Finances.File , as: FinanceFile

  def index(conn, _params) do
    changeset = FinanceFile.changeset(%FinanceFile{}, %{})
    render(conn, "index.html", changeset: changeset)
  end

  def convert(conn, %{"file" => file}) do

    render(conn, "convert.html")
  end

  def convert_into_csv(path) do
    File.stream!(path) 
    |> CSV.decode 
    |> Enum.map(fn {:ok, [name, price]} -> [name,price]  end)
  end
end


