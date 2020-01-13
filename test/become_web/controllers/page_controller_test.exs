defmodule BecomeWeb.PageControllerTest do
  use BecomeWeb.ConnCase
  alias Become.Finances.File
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
      conn = post(conn, "/convert", %{ :file => upload })
      assert html_response(conn, 200) =~ "Output"
    end
    test "Convert CSV file into Elixir array." do
      response = PageController.convert_into_csv("test/fixtures/test-prices.csv")
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
      assert response = expected
    end
    test "Recursively go through it and convert it into JPY, THB, USD, BTC currency"
    test "Display the result"
    test "Returns an error and if the file is not a csv format or have uneven order"
  end


end
