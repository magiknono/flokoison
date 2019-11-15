defmodule FlokiWithPoisonTest do
  use ExUnit.Case

  test "FlokiWithPoison.get_website_body()" do
    assert FlokiWithPoison.get_website_body() == "You need to suffix this method with _http or _https with a url in parameter"
  end

  test "get_website_body(url)" do
    assert FlokiWithPoison.get_website_body("elixir-lang.org") == "You need to suffix this method with _http or _https, ex: FlokiWithPoison.get_website_body_https('elixir-lang.org')"
  end

  test "get_website_body_http(url)" do
    assert FlokiWithPoison.get_website_body_http("info.cern.ch/hypertext/WWW/TheProject.html/") == :ok
  end

  test "get_website_body_https(url)" do
    assert FlokiWithPoison.get_website_body_https("elixir-lang.org") == :ok
  end

  test "get_elixir_current_version" do
    assert FlokiWithPoison.get_elixir_current_version() == {:ok, "Elixir v1.9 released"}
  end

end
