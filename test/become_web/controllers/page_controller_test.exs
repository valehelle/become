defmodule BecomeWeb.PageControllerTest do
  use BecomeWeb.ConnCase
  alias BecomeWeb.PageController

  describe "index/2" do
    test "Render the page", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Become"
    end
  end


  describe "convert/2" do
    test "Render the page", %{conn: conn} do
      upload = %Plug.Upload{path: "test/fixtures/test-prices.csv", filename: "test-prices.csv"}
      conn = post(conn, "/convert", %{ "file" => %{"path" => upload}})
      assert html_response(conn, 200) =~ "Output"
    end
    test "Convert CSV file into Elixir array." do
      response = PageController.decode_csv("test/fixtures/test-prices.csv")
      expected = [
        ["Product", "Price (MYR)"],
        ["Smartphone", "4399.56"],
        ["Smartwatch ", "2500"],
        ["Laptop ", "6999.6"],
        ["Laptop Pro", "12999.5"],
        ["Laptop Air", "5500.55"],
        ["iDesktop ", "10500"],
        ["iDesktop Pro", "16599.99"],
        ["Wireless Charger", "150"],
        ["iDesktop Pro Display", "5999"],
        ["iTablet", "4333.66"],
        ["iTablet Pro", "7500.88"]
      ]
      assert response == expected
    end
    
    test "Get the exchange rate of JPY, THB, USD" do
      response = PageController.get_country_exchange_rate()
                 |> Map.keys()

      expected = ["JPY","THB","USD"]
      assert response == expected
    end
    
    test "Get the exchange rate of BTC" do
      response = PageController.get_bitcoin_exchange_rate()
                 |> Map.keys()

      expected = ["BTC"]
      assert response == expected
    end
    
    test "Get the exchange rate of JPY, THB, USD, BTC" do
      response = PageController.get_exchange_rate()
                 |> Map.keys()

      expected = ["BTC","JPY","THB","USD"]
      assert response == expected
    end

    test "Get list of products with all BTC, JPY, THB, USD" do

      convertion_rate = %{
        "BTC" => 2,
        "JPY" => 3,
        "THB" => 4,
        "USD" => 5
      }
      product_list = [
        ["Smartphone", "4399.56"],
        ["Smartwatch", "1000"],
      ]

      response = PageController.get_product_with_currency(product_list, convertion_rate)

      expected = [
        %{
          "name" => "Smartphone",
          "BTC" => "8,799.12",
          "JPY" => "13,198.68",
          "THB" => "17,598.24",
          "USD" => "21,997.80"
        },
        %{
          "name" => "Smartwatch",
          "BTC" => "2,000.00",
          "JPY" => "3,000.00",
          "THB" => "4,000.00",
          "USD" => "5,000.00"
        }
      ]
      assert response == expected
    end

    test "Convert currency given a value and exchange rate" do
      convertion_rate = %{
        "USD" => 2
      }

      {:ok, money} = Money.parse("23243", :MYR)

      response = PageController.convert_currency(money, convertion_rate, "USD")
      expected = "46,486.00"
      assert response == expected

    end
  end


end
