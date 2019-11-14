defmodule FlokiWithPoisonTest do
  use ExUnit.Case
  doctest FlokiWithPoison

  test "greets the world" do
    assert FlokiWithPoison.hello() == :world
  end
end
