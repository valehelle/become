defmodule BecomeWeb.PageController do
  use BecomeWeb, :controller
  alias Become.Finances.File , as: FinanceFile

  def index(conn, _params) do
    changeset = FinanceFile.changeset(%FinanceFile{}, %{})
    render(conn, "index.html", changeset: changeset)
  end

  def convert(conn, %{"file" => %{"path" => upload}}) do
    csv = decode_csv(upload.path)
    [title | content] = csv
    Enum.map(content, fn [name, price] -> price end)
    render(conn, "convert.html")
  end

  def decode_csv(path) do
    File.stream!(path) 
    |> CSV.decode 
    |> Enum.map(fn {:ok, [name, price]} -> [name,price]  end)
  end

  def get_convertion_rate() do
    country_rate = get_country_convertion_rate()
    bitcoin_rate = get_bitcoin_convertion_rate()
    Map.merge(country_rate, bitcoin_rate)
    
  end

  def get_country_convertion_rate() do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("https://api.exchangerate-api.com/v4/latest/MYR")
    rates = Poison.decode!(body)
            |> Map.get("rates")
            |> Map.take(["JPY", "THB", "USD"])
  end

  def get_bitcoin_convertion_rate() do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("https://api.coingecko.com/api/v3/exchange_rates")
    bitcoin_rate = Poison.decode!(body)
            |> Map.get("rates")
            |> Map.get("myr")
            |> Map.get("value")
    %{"BTC" => bitcoin_rate}
  end

  def get_product_with_currency(product_list, convertion_rate) do
    IO.inspect Enum.map(product_list, 
      fn [name, price] -> 

        {:ok, value} = Money.parse(price, :MYR)

        btc = convert_currency(value, convertion_rate, "BTC") 

        jpy = convert_currency(value, convertion_rate, "JPY") 

        thb = convert_currency(value, convertion_rate, "THB") 

        usd = convert_currency(value, convertion_rate, "USD") 
        
        %{
          "name" => name,
          "BTC" => btc,
          "JPY" => jpy,
          "THB" => thb,
          "USD" => usd
        }
      end)
  end

  def convert_currency(money, convertion_rate, currency) do
    Money.multiply(money, Map.get(convertion_rate, currency))
    |> Money.to_string(symbol: false)
  end

end


