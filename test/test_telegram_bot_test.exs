defmodule TestTelegramBotTest do
  use ExUnit.Case
  doctest TestTelegramBot

  test "greets the world" do
    assert TestTelegramBot.hello() == :world
  end
end
