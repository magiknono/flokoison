defmodule FlokiWithPoison do
  @help_website_body "You need to add"
  @http_ok 200
  @http_not_found 404
  @elixir_url "https://elixir-lang.org"

  @moduledoc """
  Documentation for FlokiWithPoison.
  """
  @doc """
  `get_website_body/0` alert you that an url must be given in parameter
  """
  def get_website_body, do: ~s(#{@help_website_body} a url in parameter)


  @doc """
  `get_website_body/1` return http(s) body of a given url

        iex> FlokiWithPoison.get_website_body("http://info.cern.ch/hypertext/WWW/TheProject.html")
        <HEADER>
        <TITLE>The World Wide Web project</TITLE>
        <NEXTID N="55">
        </HEADER>
        <BODY>
        <H1>World Wide Web</H1>The WorldWideWeb (W3) is a wide-area<A
  """

  def get_website_body(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: @http_ok, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: @http_not_found}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  `get_elixir_current_version` return elixir last released version from elixir-lang website

        iex> FlokiWithPoison.get_elixir_current_version
        {:ok, "Elixir v1.9 released"}
  """

  def get_elixir_current_version do
    case HTTPoison.get(@elixir_url) do
      {:ok, %HTTPoison.Response{status_code: @http_ok, body: body}} ->
        url =
          body
          |> Floki.find("div.news > h3 > a")
          |> Floki.text

      {:ok, url}
      {:ok, %HTTPoison.Response{status_code: @http_not_found}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  `scrape_text/2` return text scraped of a given url with given css selectors of a html node

        iex> FlokiWithPoison.scrape_text("https://elixir-lang.org/","div.news > h3 > a")
        {:ok, "Elixir v1.9 released"}
  """
  def scrape_text(url, css_selectors) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: @http_ok, body: body}} ->
        url =
          body
          |> Floki.find("#{css_selectors}")
          |> Floki.text

      {:ok, url}
      {:ok, %HTTPoison.Response{status_code: @http_not_found}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  `scrape_link/2` return link scraped of a given url with given css selectors of a html node

        iex> FlokiWithPoison.scrape_link("https://elixir-lang.org/","div.news > h3 > a")
        {:ok, "Elixir v1.9 released"}
  """
  def scrape_link(url, css_selectors) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: @http_ok, body: body}} ->
        url =
          body
          |> Floki.find("#{css_selectors}")
          |> Floki.attribute("href")

      {:ok, url}
      {:ok, %HTTPoison.Response{status_code: @http_not_found}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

end
