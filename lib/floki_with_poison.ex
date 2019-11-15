defmodule FlokiWithPoison do
  @help_website_body "You need to suffix this method with _http or _https"
  @http_ok 200
  @http_not_found 404
  @elixir_url "https://elixir-lang.org"

  @moduledoc """
  Documentation for FlokiWithPoison.
  """

  def get_website_body, do: ~s(#{@help_website_body} with a url in parameter)
  def get_website_body(url), do: "#{@help_website_body}, ex: FlokiWithPoison.get_website_body_https('" <> url <> "')"

  @doc """
  `get_website_body_http/1` return http body of a given url

    ## Examples

        iex> FlokiWithPoison.get_website_body_http("info.cern.ch/hypertext/WWW/TheProject.html")
        <HEADER>
        <TITLE>The World Wide Web project</TITLE>
        <NEXTID N="55">
        </HEADER>
        <BODY>
        <H1>World Wide Web</H1>The WorldWideWeb (W3) is a wide-area<A
  """

  def get_website_body_http(url) do
    case HTTPoison.get("http://" <> url) do
      {:ok, %HTTPoison.Response{status_code: @http_ok, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: @http_not_found}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  `get_website_body_https/1` return https body of a given url

    ## Examples

        iex>FlokiWithPoison.get_website_body_https("elixir-lang.org")
  """
  def get_website_body_https(url) do
    case HTTPoison.get("https://" <> url) do
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

    ## Examples

        iex>FlokiWithPoison.get_elixir_current_version
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

end
