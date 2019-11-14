defmodule FlokiWithPoisonTest do
  use ExUnit.Case
  doctest FlokiWithPoison

  test "greets the world" do
    assert FlokiWithPoison.hello() == :world
  end

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

end
